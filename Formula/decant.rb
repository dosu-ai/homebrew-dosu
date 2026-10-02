class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.9.1/decant-darwin-arm64.tar.gz"
      sha256 "8865fa429ab0cccdc58d555db7f88e6762c846355c34ebb1670a548b3dd2b45c"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.9.1/decant-darwin-x64.tar.gz"
      sha256 "ebdc53333eca679ed71aa133efe28512cb34b1a6760c890f13679ff4e11bde16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.9.1/decant-linux-arm64.tar.gz"
      sha256 "5af19413a025c63d959635cfb8e39cb5a12c566261c903f1f36fae5cf920508b"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.9.1/decant-linux-x64.tar.gz"
      sha256 "961aa05fa64775fdc0b54ae7bf4c1bf31d46eeacdcd2627bfaf7307589efc2ea"
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
