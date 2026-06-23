# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.21.0"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "13b5166e83495f2c949536d9ed42346f09796f120489410dd76e8f16e52eabb3"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "9f9f55ee0cb3a79527bb13c2f0e47f1948eab0d9862a0c355e18ee8a48e8dcca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "e2d6426003d371216323445f3715f190a40f6483c5ba3afbc9a9c4b52f0f6d09"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "39d36d08c7058a853e6c9ee983de5322908c9ca36f9fae9eebee164f6559ab26"
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
