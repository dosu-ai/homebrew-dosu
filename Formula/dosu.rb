# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.1.7"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64.tar.gz"
      sha256 "1f54c4fe28cf94f837f75e0b416704a560a0a7f5460d26b30f3a301cabd86256"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64.tar.gz"
      sha256 "1008815a659c44525a2cb803b37b0d0cbdb499ac1ebe7679fb4641cc46cd92dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64.tar.gz"
      sha256 "447a67dcfb7ff836f45908264d411a94354e42f48ede9835f0c2988a7d83df94"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64.tar.gz"
      sha256 "5148328e2ec4b0a21cbe2ed9446f062a2bef7ad7da5ae7ce9f91502033ad8836"
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
