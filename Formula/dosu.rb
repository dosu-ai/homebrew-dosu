# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.29.0"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "de08f5dc3fb32a6ff732f2d5be20e8a8dfc5b930c365097f16d399fb05552f98"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "c33f27c72d87fb46bf8980b793f067a57b867390dbfff716ae19a8e3938cbd38"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "fc8a92c7072c0bc7b0d9d81b42bd13343902ee467530ff547c6a976ab931666f"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "845cc8e9cac1d89775d9031aede820bf6bde70313fc27bc5998048d2441a9d61"
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
