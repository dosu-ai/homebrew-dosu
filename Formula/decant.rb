class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.2.1/decant-darwin-arm64.tar.gz"
      sha256 "5f37aa7e9c77bf6afd38470db4b80e7ae162a6806c49649c1663ef75a3c60040"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.2.1/decant-darwin-x64.tar.gz"
      sha256 "d25d17a4915dd0cc0077d85a6feb42808622b92ddb512ece3b71597714ecd1d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.2.1/decant-linux-arm64.tar.gz"
      sha256 "e717c5b21a0f71d4301bb0c5c134565ccdb31328b5fd218e6a9d08e253653c8a"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.2.1/decant-linux-x64.tar.gz"
      sha256 "dec97e46cc7b1027cba2c9e03832258835920d3822a634b6ee214eca9db08a54"
    end
  end

  def install
    bin.install "decant"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decant --version")
  end
end
