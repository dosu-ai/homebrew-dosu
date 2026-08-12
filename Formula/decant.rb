class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.4.0/decant-darwin-arm64.tar.gz"
      sha256 "1b6ab1882619ba4b519a02efa7ae8916a056265837c6f14eb32d5ec0653bbaa2"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.4.0/decant-darwin-x64.tar.gz"
      sha256 "6667790d69c176317688577504745ac2206193c6b8e9abb7ad33d7ede63e188b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.4.0/decant-linux-arm64.tar.gz"
      sha256 "e1c707713dc82ac6d51e99f1cd0f5bb7fadced24600dafddb800fe24f648ecc8"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.4.0/decant-linux-x64.tar.gz"
      sha256 "3c28d3bf184be939855edef2f21d69aec44ce3f6e45adbfc1499e81578725bb2"
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
