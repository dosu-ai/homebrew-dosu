#!/bin/bash
set -euo pipefail

# Update Homebrew formula with a new release version and checksums.
# Usage: ./scripts/update-formula.sh <version>
# Example: ./scripts/update-formula.sh 0.1.7

VERSION="${1:-}"

if [[ -z "${VERSION}" ]]; then
  echo "Usage: ${0} <version>"
  echo "Example: ${0} 0.1.7"
  exit 1
fi

# Strip 'v' prefix if provided.
VERSION="${VERSION#v}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "${SCRIPT_DIR}")"
FORMULA_FILE="${REPO_DIR}/Formula/dosu.rb"

echo "Updating formula to version ${VERSION}..."

RESOLUTION_OUTPUT="$(python3 - "${VERSION}" "${FORMULA_FILE}" <<'PY'
import hashlib
import json
import os
import sys
import urllib.error
import urllib.request

version = sys.argv[1]
formula_file = sys.argv[2]
release_api_url = f"https://api.github.com/repos/dosu-ai/dosu-cli/releases/tags/v{version}"

platforms = [
    (
        "DARWIN_X86",
        "Darwin x86_64",
        "dosu-darwin-x64.tar.gz",
    ),
    (
        "DARWIN_ARM",
        "Darwin arm64",
        "dosu-darwin-arm64.tar.gz",
    ),
    (
        "LINUX_X86",
        "Linux x86_64",
        "dosu-linux-x64.tar.gz",
    ),
    (
        "LINUX_ARM",
        "Linux arm64",
        "dosu-linux-arm64.tar.gz",
    ),
]


def build_request(url: str) -> urllib.request.Request:
    token = os.environ.get("GITHUB_TOKEN") or os.environ.get("GH_TOKEN")
    headers = {
        "Accept": "application/vnd.github+json",
        "User-Agent": "homebrew-dosu-update-formula",
    }
    if token:
        headers["Authorization"] = f"Bearer {token}"
    return urllib.request.Request(url, headers=headers)


def fetch_json(url: str):
    with urllib.request.urlopen(build_request(url)) as response:
        return json.load(response)

def hash_asset(url: str):
    hasher = hashlib.sha256()
    with urllib.request.urlopen(build_request(url)) as response:
        while True:
            chunk = response.read(1024 * 1024)
            if not chunk:
                break
            hasher.update(chunk)
    return hasher.hexdigest()


def resolve_from_release_api():
    release = fetch_json(release_api_url)
    assets = {asset.get("name"): asset for asset in release.get("assets", [])}

    resolved = []
    for key, label, asset_name in platforms:
        asset = assets.get(asset_name)
        if asset is None:
            raise SystemExit(f"Missing release asset for {label}: {asset_name}")

        digest = asset.get("digest") or ""
        if digest.startswith("sha256:"):
            checksum = digest.split(":", 1)[1]
        else:
            browser_download_url = asset.get("browser_download_url")
            if not browser_download_url:
                raise SystemExit(f"Release asset {asset_name} is missing browser_download_url")
            checksum = hash_asset(browser_download_url)
        resolved.append((key, label, asset_name, checksum))

    print(f"Resolved release v{version} using GitHub Release API", file=sys.stderr)
    return resolved


resolved_assets = resolve_from_release_api()

values = {}
for key, _label, asset_name, checksum in resolved_assets:
    values[f"{key}_NAME"] = asset_name
    values[f"{key}_SHA"] = checksum

formula = f"""# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "{version}"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{{version}}/{values['DARWIN_X86_NAME']}"
      sha256 "{values['DARWIN_X86_SHA']}"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{{version}}/{values['DARWIN_ARM_NAME']}"
      sha256 "{values['DARWIN_ARM_SHA']}"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{{version}}/{values['LINUX_X86_NAME']}"
      sha256 "{values['LINUX_X86_SHA']}"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{{version}}/{values['LINUX_ARM_NAME']}"
      sha256 "{values['LINUX_ARM_SHA']}"
    end
  end

  def install
    executable = if File.file?("dosu")
      "dosu"
    else
      Dir["dosu-*"].find {{ |path| File.file?(path) }}
    end

    odie "Could not find a dosu executable in the extracted archive" unless executable

    bin.install executable => "dosu"
  end

  test do
    assert_match version.to_s, shell_output("#{{bin}}/dosu --version")
  end
end
"""

with open(formula_file, "w", encoding="utf-8") as handle:
    handle.write(formula)

for key, label, asset_name, checksum in resolved_assets:
    print(f"{label}: {asset_name} {checksum}")
PY
)"

echo "${RESOLUTION_OUTPUT}"
echo "Updated ${FORMULA_FILE}"
