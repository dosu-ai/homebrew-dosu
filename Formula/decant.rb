class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.8.0/decant-darwin-arm64.tar.gz"
      sha256 "ad95c8f5368c3e0eee377b4841bd31def49dafe050afe36081b36363c65e936a"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.8.0/decant-darwin-x64.tar.gz"
      sha256 "f61732f9495594543f085655379913535829d49b4cc8da851c70d84644c5f84d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.8.0/decant-linux-arm64.tar.gz"
      sha256 "ea95f5aeba17abe4551cee2bef1a92ede65633c4813ed7085d40a79afba7c145"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.8.0/decant-linux-x64.tar.gz"
      sha256 "4378de7df0417363b5b2bc5cfbbbff8a47ea0cbe58eaf16f023ef701ed302f91"
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
