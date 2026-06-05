# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.16.1"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64.tar.gz"
      sha256 "8f255f075a35ffb37862c3d95eaaa7835c3283e12398998b3a04a717b0141c6b"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64.tar.gz"
      sha256 "b9a16274bef77ed3744ecebea0ced8286cdd4dadf5e4cc2350c4d7753f8d68bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64.tar.gz"
      sha256 "1fad16b823cff08592ad6d7fbae8ae352267cef65c09eeb2c0614f515c699740"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64.tar.gz"
      sha256 "e30daafe46b420ab1fd4ad1ec3e6447f02e00626f40e16cf2c09cd8a185d8223"
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
