# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.33.2"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "63c39fae26659c6c69c84d5e71b6e5e4712fbac7716adf0fd4c4b514cbe8489d"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "4b88d18059038a55f6ddec097765e4ad25df80aaec80cc9728ef8a4468198aaf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "ae4449f07147e3975ae5e44cddc2c2a6fd9491601ba605256db4f7aacec91e9e"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "f56f0fa92c70125c4a4603231be045c19cc0ff61553ef8944583dd8e509e4233"
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
