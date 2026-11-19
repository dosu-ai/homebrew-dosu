class Decant < Formula
  desc "Analyze AI coding agent sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.18.0/decant-darwin-arm64.tar.gz"
      sha256 "76d64c2609dc479dc224f6b22c249bb360aa3e0f828b97e6293ac58670dd828f"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.18.0/decant-darwin-x64.tar.gz"
      sha256 "2821f2c3731419ddf463c663dda8c16e2c5526ca87363635417f812f6c93673e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.18.0/decant-linux-arm64.tar.gz"
      sha256 "0b856c3acd54ed56a78697bbeae70d0141ea40c338ccb42fb38c9f4639c6fdeb"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.18.0/decant-linux-x64.tar.gz"
      sha256 "b5d547e0b4fbbfae3fc7e2633cba20c97c34ebf0be5d183e86a84a1f602c538d"
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
