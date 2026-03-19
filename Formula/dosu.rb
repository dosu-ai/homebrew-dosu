# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.1.6"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_x86_64.tar.gz"
      sha256 "7f980eb89cbebfa6b1706b45aa6463fdca7292e7e3d8b346c563904cfd210363"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Darwin_arm64.tar.gz"
      sha256 "263913f8bcd311082eb0ee1fd0495ca68b93bd2ce19adc993ea5aed5a12ca38e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_x86_64.tar.gz"
      sha256 "3758c46c6fcb673c0a0aa04ef0d24954e299bac660c157b38f4990031e306132"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu_Linux_arm64.tar.gz"
      sha256 "1737431503903cdd658cfd0c2f07cef5433bc37d887a5359cd66c64f4972b520"
    end
  end

  def install
    bin.install "dosu"
  end

  test do
    system "#{bin}/dosu", "--version"
  end
end
