# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.1.5-alpha"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_x86_64.tar.gz"
      sha256 "6fe32b9738fc7583b8f46da57d87e5e4c7917d2fe8018339958c847bcb20fd7d"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_arm64.tar.gz"
      sha256 "5a2c14850b9bea1f451ab7cc896ae2725496c44aa2af4a443f959c85cde33b80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_x86_64.tar.gz"
      sha256 "c963f896304644f374e3ccd92bc315ceadce6197e7d59703f6c333cd5af8c164"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_arm64.tar.gz"
      sha256 "e7bb686ec4832924b66521f6b694a443a2f343dfe2e5577869ee0051f92b0998"
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
