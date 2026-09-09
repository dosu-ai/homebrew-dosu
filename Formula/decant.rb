class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.2/decant-darwin-arm64.tar.gz"
      sha256 "213c4748fd27d59bfc985bc3b8128687c4a86c46387fece26b5bb4f0dbd5d082"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.2/decant-darwin-x64.tar.gz"
      sha256 "4f5d8c9c5c416f2807c385262c3c29e5cf80e0b403780ffcdca08d40f9bc7f51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.2/decant-linux-arm64.tar.gz"
      sha256 "5520dd1a3c3e1d040b1be3b5f734bb638678d756f7f9661611d900922524959c"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.2/decant-linux-x64.tar.gz"
      sha256 "d6fe113a56af8d61871aac23369e58bc568c033c90bdece8b2d3c375c9cd0e43"
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
