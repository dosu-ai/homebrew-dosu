class Decant < Formula
  desc "Analyze AI coding agent sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.16.0/decant-darwin-arm64.tar.gz"
      sha256 "85cdd432de30dd82b75f3c2677ee55851734cb25bc3ced8c9e57d3f60c12ab88"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.16.0/decant-darwin-x64.tar.gz"
      sha256 "e7dba02fcd01c34428fe610022d90043ec9b6a54d048e7b03ede2edd42fc079d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.16.0/decant-linux-arm64.tar.gz"
      sha256 "1efa9fbb041cebef051d9d8ea6e037caef11a0fece3fcdb875f2c5d68f4b623c"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.16.0/decant-linux-x64.tar.gz"
      sha256 "40a12c6555c595a674773e358d36e466ce89e8e90f4d9607edb165658bef5909"
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
