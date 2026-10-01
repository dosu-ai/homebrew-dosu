# typed: false
# frozen_string_literal: true

class Dosu < Formula
  DOSU_VERSION = "0.65.1"

  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "b3cdf9cba71d5928c9cd13c3b1f02c547774f2e6e2c6cb9170936212f6cd5045"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "8053e0144c34923751a62d3da2de2ce7e997975affd9346084dd4bab92ad2441"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "793bebbe71fcbb6ee9b0ed8c5ae5f3232a8d0f80eda27b552fa53049c4b06e92"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "5a68db2c3f0156370d0b61d40a9cf104cc60705c8711f96eeec5d238360324c9"
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
