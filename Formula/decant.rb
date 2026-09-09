class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.1/decant-darwin-arm64.tar.gz"
      sha256 "c137e9231aeca972e9cb7903b1bdfecdf3ce7ae8a65083d6bbcd8891ca83a50b"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.1/decant-darwin-x64.tar.gz"
      sha256 "7dcb784e302b032bbb7627c4a72e00bc57a68a5f508deb212c54b2cad7b6d834"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.1/decant-linux-arm64.tar.gz"
      sha256 "d6efe6bbec9244ba6ff3578383f5031c68a3b0f84a0fd8798e7dec666036b6a8"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.1/decant-linux-x64.tar.gz"
      sha256 "3cba6bf333070ed9ec7b6dff7953f95b24ebc3e06d9589df8aafbbedf7a59e2d"
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
