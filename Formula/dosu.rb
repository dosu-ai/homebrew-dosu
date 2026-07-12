# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.32.1"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "253737bcdec2554bc40cba88b94e70ad23aaf6798b83dba3d965cb5c4e687e3a"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "63dba4a562134520b70822819c4ccda7972f9074bedc2ba81828a1e1dc816fa5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "b4c1a5da85bcb4cb9df0471da8c2fa05edaf39620215873068299bf23c23ad56"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "74f6a13db69007afd553f4db7b7cbe9fd56624e0c1c29f358f37c2e4f4067105"
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
