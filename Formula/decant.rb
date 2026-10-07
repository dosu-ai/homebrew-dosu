class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.1/decant-darwin-arm64.tar.gz"
      sha256 "755ae675f457b53e858c355faf0ac204046be624943dec1d2c6678f36392f556"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.1/decant-darwin-x64.tar.gz"
      sha256 "c1cca7edecc0df22bae2f283fb8b9e2afb6db0355da9d4c31feff5e5d50efea0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.1/decant-linux-arm64.tar.gz"
      sha256 "de57bc619ca9e3f46066e52d99e7cfccaa0dae31e240766e45e262a6bb783d81"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.1/decant-linux-x64.tar.gz"
      sha256 "4c68177272dcaf08ab93e060e47ad9a8e875e8907e7c761ada3bdf5f3d9ff47c"
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
