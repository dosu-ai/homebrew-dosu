# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.20.3"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64.tar.gz"
      sha256 "1acf076c3af5c937bd1adce719941443c0f508f9880a1859bec5393859fc292e"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64.tar.gz"
      sha256 "573be8217b161ed0405133933a96b97bb2c5eab6ec3d1938ca6eee8566e84d85"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64.tar.gz"
      sha256 "f58f816ea2b9a656aa7313b3f73aeb4682104d8128dfbf5dc1b04302b19e4624"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64.tar.gz"
      sha256 "24d7465a3a9e29f4db20576a1dc863f57706124231dfcdb2c2af48d49a3b7e3a"
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
