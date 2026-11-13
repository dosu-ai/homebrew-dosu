class Decant < Formula
  desc "Analyze AI coding agent sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.15.0/decant-darwin-arm64.tar.gz"
      sha256 "225a731bc3da60e4b3a34509045780d6cdd19658f944cb92b9bb7ae1eefdb1bd"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.15.0/decant-darwin-x64.tar.gz"
      sha256 "fe71eefde3ffa7d3f1348e1d43199e40c34195fb632e7084b6b5cd62ba5b849b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.15.0/decant-linux-arm64.tar.gz"
      sha256 "c693ca552133bd0ea6b0d9d462aff940384ee8a1ff9a9617599efed255bc6b4a"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.15.0/decant-linux-x64.tar.gz"
      sha256 "da0005d26b5dd29a7e522d020821976398b4b711efe0e150e43d8ceb48977151"
    end
  end

  def install
    bin.install "decant"
  end

  def caveats
    <<~EOS
      Run `decant` to start the local UI at http://127.0.0.1:3000
      (it prints the link and opens your browser).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decant --version")
  end
end
