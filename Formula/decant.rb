class Decant < Formula
  desc "Analyze AI coding agent sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.15.1/decant-darwin-arm64.tar.gz"
      sha256 "6ef3cf5cc7a316063dfdca4a24c2b8697092e461278ccc3128951f410ca9e196"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.15.1/decant-darwin-x64.tar.gz"
      sha256 "efa3aec89468f0be9273d1323e0bd90bc2d4aaa98f85b25835d75577bd88e2f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.15.1/decant-linux-arm64.tar.gz"
      sha256 "41f762b1cc0aaaef1a2aac2c1862090946055f16b03b150549bf45f063971a5f"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.15.1/decant-linux-x64.tar.gz"
      sha256 "0b8254dce9fad0ee13a5feaed1769bb79fb6ecd486779575ff590bc223e456d1"
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
