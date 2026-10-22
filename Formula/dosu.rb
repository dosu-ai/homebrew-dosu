# typed: false
# frozen_string_literal: true

class Dosu < Formula
  DOSU_VERSION = "0.68.4"

  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "76de1241b942e4a39a43623a1a29ad159819f43fe679c501ead77dfa8b1413ef"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "7e064b6279b7689c2d365f9f103daba23fdcb59006fed99dab393b8a494e0f94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "f10492544ccd95bab9e55c78b3606af42703a3e47c53d82a84195dd4b74abe10"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "44b7da686d78217c1e5606d0b500c1093ed05569ee0f9d8aa7ad2dd12bab9c24"
    end
  end

  def install
    executable = if File.file?("dosu")
      "dosu"
    else
      Dir["dosu-*"].find { |path| File.file?(path) }
    end

    odie "Could not find a dosu executable in the extracted archive" unless executable

    bin.install executable => "dosu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dosu --version")
  end
end
