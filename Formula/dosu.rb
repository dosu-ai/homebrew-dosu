# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.1.4-alpha"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_x86_64.tar.gz"
      sha256 "8874f28c6b9ffbe0fd8c43f2a4f1463cd972e834aea6b7700e387a08667e7040"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_arm64.tar.gz"
      sha256 "08af472067252ff71d6750a8a607dd9ba8e18b0c9b6d87efd1c627a55dc26ac1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_x86_64.tar.gz"
      sha256 "736b124513f473ff4d9dace7eafd051d8d3a958595c60ed945f768c154aececf"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_arm64.tar.gz"
      sha256 "211e4066866cae8100178d314d46e3b916fdc07d7c1fe2f412d87b7dee375a5f"
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
