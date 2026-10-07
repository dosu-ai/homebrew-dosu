class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.0/decant-darwin-arm64.tar.gz"
      sha256 "2dbd8f3c340d3ef7e43709f755170a4218aba75fcaa3bfdbbd48bc051148e05f"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.0/decant-darwin-x64.tar.gz"
      sha256 "cb30a73b557aa3450afa3cd49d70dd85e5864dab8ea0a92fd6a109108e96a933"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.0/decant-linux-arm64.tar.gz"
      sha256 "fcbbf8ac7a5d2ec1a4cf8b2ddc79229ebccb6d286ad686c16e259e5e3e5cdde8"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.0/decant-linux-x64.tar.gz"
      sha256 "096ecd5eac64c36e812f733ba2ae2098b9fb15e5506e6950f18b9e1a67abcdd6"
    end
  end

  def install
    bin.install "decant"
  end

  def caveats
    <<~EOS
      Run `decant` to start the local UI at http://127.0.0.1:3000
      (it prints the link and opens your browser).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decant --version")
  end
end
