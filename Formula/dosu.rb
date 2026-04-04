# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.3.0"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64.tar.gz"
      sha256 "e7eb0bf364ee1f114844fef66c8f774d226064ed530c24a58110b2437c4f8d0e"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64.tar.gz"
      sha256 "9ad48815817a431be3168d68c300930e5eb15f2b2c3d0c7d8e7a743d5b59e44d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64.tar.gz"
      sha256 "56b3ffdb4d7b5f47eb12fd9268cfd74ba072e47de608810952e9f0a8a62d7d88"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64.tar.gz"
      sha256 "e79f1d070af179b6a987ca03a279f047f7e2267b6d24db2fe5d1cc20e8e22f3c"
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
