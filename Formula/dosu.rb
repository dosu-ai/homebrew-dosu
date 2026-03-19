# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.1.3-alpha"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_x86_64.tar.gz"
      sha256 "87aac5ae11810344591319be9550c50a4803ffd033eecb90a8a89c3676991cf4"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_arm64.tar.gz"
      sha256 "74b26b253ccd13df619fcdf5ef1fea97535345327fb845679072fab1ffcf707f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_x86_64.tar.gz"
      sha256 "a44eb83421939ec457a2bd62cfe3909e64c7d1299f47d2068c54f5b6c8fa35a1"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_arm64.tar.gz"
      sha256 "8ca8fe8943076ced068fcf63407d368d600b22e37cfbc5175a95b65d5e809d90"
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
