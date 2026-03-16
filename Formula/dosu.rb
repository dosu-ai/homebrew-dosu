# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.1.2-alpha"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_x86_64.tar.gz"
      sha256 "08d02b9ae6330a4d8f097638de597c04078bce58ed0b6540bd2a53f2468dee85"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_arm64.tar.gz"
      sha256 "e5a345bdcd217b2d4faf0312676b272ad09a3f21fb501f781d1e5b2f76f2243c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_x86_64.tar.gz"
      sha256 "59c43d8129fd38da2db311409a2eb1bd5611437fc1bada263ec28e4c787d1442"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_arm64.tar.gz"
      sha256 "273f9608f45b02e8bc3c5b302f88f310be834384c8a81758b3f7392220efe8a7"
    end
  end

  def install
    bin.install "dosu"
  end

  def post_install
    return unless OS.mac?

    ohai "Removing quarantine attribute..."
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{bin}/dosu"
  end

  test do
    system "#{bin}/dosu", "--version"
  end
end
