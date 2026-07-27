class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.1.0/decant-darwin-arm64.tar.gz"
      sha256 "b5fb03c6b8c233cc20f466ad74fbb762192bba75999b457543e7e401dad2931d"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.1.0/decant-darwin-x64.tar.gz"
      sha256 "85828b690be4503c2dfcb72ea6b495386d40ceb54e3f0986fabaabd744f9ed4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.1.0/decant-linux-arm64.tar.gz"
      sha256 "5fc58736b23595b416122d1394e4270d7d7f9b492fea708ea1c3dfe4136d418b"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.1.0/decant-linux-x64.tar.gz"
      sha256 "d5ae032b0004de3874943cfa20dc22f0b19f741fee4a899033306f9f31d09a9d"
    end
  end

  def install
    bin.install "decant"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decant --version")
  end
end
