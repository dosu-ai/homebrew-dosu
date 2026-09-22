class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.6.0/decant-darwin-arm64.tar.gz"
      sha256 "f58c1bab1fd77a31bb30013050c3551245c5bb50a4d3b2e2f90f2d5a9b64310c"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.6.0/decant-darwin-x64.tar.gz"
      sha256 "2570c70ed10f7d325b0ab2272dca9d7da41a1e30bb897cd2c420248da158dbcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.6.0/decant-linux-arm64.tar.gz"
      sha256 "69e673174c10ffb0404923e0fcb09793af12e43a3fb0b26211a0346756a649fb"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.6.0/decant-linux-x64.tar.gz"
      sha256 "80d1a0d85b54e83f2eecb635e7e87df804c17427fe0ba0555d46d53accab327f"
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
