# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.7.0"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64.tar.gz"
      sha256 "2acd3dda27b3e24de2c636eb8d0a1151fc1e5df4ffdddbb72dbb05ab2a62c60e"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64.tar.gz"
      sha256 "a02194dce3ad4ad34ed022965bae0c09d410a745a31b4744fc1e33fa00b96640"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64.tar.gz"
      sha256 "2403cf87ae579f4fab3641662ec93af712da4d95f7327a6e27d116072a07b779"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64.tar.gz"
      sha256 "695538b3095bac72434f5fe1bc0bc1fac150047f628193b20408bb850c1a844c"
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
