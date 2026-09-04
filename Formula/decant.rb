class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.0/decant-darwin-arm64.tar.gz"
      sha256 "c1072f93af968dc6cdd465f0dd31ec615487f967bed5b9ae7bff31c698340436"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.0/decant-darwin-x64.tar.gz"
      sha256 "12ba5ad300b39c649693f17352989e5141ab6b7d22d2704ab59ae00235b2daa3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.0/decant-linux-arm64.tar.gz"
      sha256 "5c070e1e8deb9fd5a01254141365cc8cd6bc88e36664c96b19dbda6f684d8425"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.5.0/decant-linux-x64.tar.gz"
      sha256 "10ae98b09d6e1ad57754beb60c7e5ae0e84c2e18b0d1654dfdfb07309599dd33"
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
