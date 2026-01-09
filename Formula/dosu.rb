# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.1.0-alpha"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_x86_64.tar.gz"
      sha256 "fc94a8a1f9d0f7301bf65258e1ec74b75f802db0920fbd5dc70516796c3dec82"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_arm64.tar.gz"
      sha256 "7d50eae0bbb69bfb09cd1ed1f1ce8d35c97d8136fd935cfdb2504e4c0394c86e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_x86_64.tar.gz"
      sha256 "4e174bb3259386a8f1a7c88366e77c0682a502c07b0e3f1dd934908601b6b12b"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_arm64.tar.gz"
      sha256 "9a5031c3e77f6f39c5e9c701ab463e97946a4442de852f1a669bdc6f62143e43"
    end
  end

  def install
    bin.install "dosu"

    # Remove quarantine attribute on macOS to allow execution
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{bin}/dosu" if OS.mac?
  end

  test do
    system "#{bin}/dosu", "--version"
  end
end
