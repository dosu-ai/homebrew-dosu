# typed: false
# frozen_string_literal: true

class Dosu < Formula
  DOSU_VERSION = "0.48.2"

  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "556acfdb96d6e652039ac766eac8d9a5bf69c11913cfa355f0c8937b51e7ea42"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "901fae5f75727e7bf7ab56c3b6c298889bb7109274ece468c4c84b1f1e4ec4d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "44f20550ae3633ab36b16cf4b7645c1af1dc2a938fd25db339836f93cc28d2e2"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "6285252e84fed56d9e189fb4990a00c1bdae864cc24cdc775613d8835dcc2326"
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
