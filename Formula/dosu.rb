# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.1.5"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_x86_64.tar.gz"
      sha256 "a0b46bb281f544ca5388a2b107090d0156910322a7b2a541035742b58f853c63"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_arm64.tar.gz"
      sha256 "9bc3a116cada2060cc06f158314627e65b41df7f95c1d6e1980538e45621aa33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_x86_64.tar.gz"
      sha256 "1056add03c2c69cba38a2e39efeaecdd31b562298bb27a4eba078c9302935b2f"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_arm64.tar.gz"
      sha256 "bdf49f1e9ad837338bdfc9dee432da54f0d0287df1f1d64ac3310201078a9802"
    end
  end

  def install
    bin.install "dosu"
  end

  test do
    system "#{bin}/dosu", "--version"
  end
end
