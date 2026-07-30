class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.2.0/decant-darwin-arm64.tar.gz"
      sha256 "8611b64595ec76a596b3e919194d1653e9b4bb112251b8a4d1b0bd358c40f5d5"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.2.0/decant-darwin-x64.tar.gz"
      sha256 "3ec6f8521a39269c1d72beab772b3492dc60f0c9fb29220bc54a855f5c00bdd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.2.0/decant-linux-arm64.tar.gz"
      sha256 "b7a22cfa6bdc3b288bc6d7fb02b96d8d48876e072d507ad6947eca1a20006160"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.2.0/decant-linux-x64.tar.gz"
      sha256 "8a16d0234bb9691edca182aa0b01b28f5729c12a46dae7dbec6bd9e69ac4b66c"
    end
  end

  def install
    bin.install "decant"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decant --version")
  end
end
