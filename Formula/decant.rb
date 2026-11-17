class Decant < Formula
  desc "Analyze AI coding agent sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.17.0/decant-darwin-arm64.tar.gz"
      sha256 "dc4f1a0a4ce5eb3d08691ed6bbe8907466f04926cb5cb47c7d01570ec6f28101"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.17.0/decant-darwin-x64.tar.gz"
      sha256 "168be47e04cae9babb23765810a34ee0e0ac5542eb38ad0a85e43ad515ef0688"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.17.0/decant-linux-arm64.tar.gz"
      sha256 "6a0e056a16b4761c031192f420dad0716906e156192a12ac39c6593e0ddbe28d"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.17.0/decant-linux-x64.tar.gz"
      sha256 "b9b376b762549d3e606ad76cae916a398f49f04e939dff5660dd053b8d9dd18a"
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
