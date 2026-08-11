# typed: false
# frozen_string_literal: true

class Dosu < Formula
  DOSU_VERSION = "0.47.0"

  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "8302884dbe87bd7ec035a15e1b9bd5a273a4cd0da3efb43f5d538e84b7b64395"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "ada6874cf69d3cffb0820accfd9bc832d8aefb783c7d2125b0396ed781dfbbb2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "736af95215455f725dba39764c6a0d49397285676a495caa2d90b93421cb2375"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{DOSU_VERSION}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "6ceabf4c8439da1adb92864f6f4ea2136dbb421d1635d849bac19b27c672e092"
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
