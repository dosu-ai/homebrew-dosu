# typed: false
# frozen_string_literal: true

class Dosu < Formula
  DOSU_VERSION = "0.45.0"

  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "4803afa3f0e9a04a510d048c27dda2e4b79d78f04dea9ab10879f47dd380631a"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "c1400a09f9674c7050bd01b9959244c86098354205ea01e1fc04181cbf73d785"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "2681a029745c3b5e3810736aa12ddf8ea2cf684befaffe668f2c10c7b6528793"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "0d1b26a903222df31bb480a3c52e8f4a37b5ad645a86f4bb7435c2a6b56ddc31"
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
