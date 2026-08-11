class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.3.0/decant-darwin-arm64.tar.gz"
      sha256 "0eddc2ef515af55b3b36b73d4a351e61777ec0d77b18afd0df4441fa98a98c2e"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.3.0/decant-darwin-x64.tar.gz"
      sha256 "67feb5157aa922bbfe7758f9192f48b8c83ed3a2403623a8ee8863968e3ba6c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.3.0/decant-linux-arm64.tar.gz"
      sha256 "61941102841625bc194fe3730d12206a93d968847f9f7de5a19d4182618c0487"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.3.0/decant-linux-x64.tar.gz"
      sha256 "78b1d0be16ab90bc9ed14272daecf7521cf6bd59dd05ae4b625038998645802c"
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
