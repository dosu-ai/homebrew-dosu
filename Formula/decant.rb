class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.9.0/decant-darwin-arm64.tar.gz"
      sha256 "307f86699f73d1df50a402e8877bc6dbdff1dfdd899307544ebc3e79f35f3cc5"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.9.0/decant-darwin-x64.tar.gz"
      sha256 "170128c5f99e1c117e3724d137a441f6b1c75ad7aa6e314cde5bde20f0462a29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.9.0/decant-linux-arm64.tar.gz"
      sha256 "f510812645e0e8eb6eda371356fc55eda2cdd3f0437b51f40175a056ec71587c"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.9.0/decant-linux-x64.tar.gz"
      sha256 "06cc238b51dd58ea772c01916f848455cd73cbe8e2384d3e6b3458d1935d7365"
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
