#!/bin/bash
set -euo pipefail

# Update Homebrew formula with a new release version and checksums.
# Usage: ./scripts/update-formula.sh <version>
# Example: ./scripts/update-formula.sh 0.1.7

VERSION="${1:-}"

if [[ -z "${VERSION}" ]]
then
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

RESOLUTION_OUTPUT="$(
  python3 "${SCRIPT_DIR}/update-formula.py" "${VERSION}" "${FORMULA_FILE}"
)"

echo "${RESOLUTION_OUTPUT}"
echo "Updated ${FORMULA_FILE}"
