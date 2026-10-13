class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.11.0/decant-darwin-arm64.tar.gz"
      sha256 "fb63afc0c172c14d9914619e70c68ddab5239b3726300d79cfa872ec070b0fca"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.11.0/decant-darwin-x64.tar.gz"
      sha256 "2c6815efdde0e04cac3f8028c6a52d15ac266d38fa23d5ac794a1caa5b558bdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.11.0/decant-linux-arm64.tar.gz"
      sha256 "f22ba09a540393515475c52bc1963357c432b81307e75b023ca26bc076feec01"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.11.0/decant-linux-x64.tar.gz"
      sha256 "6c10e12d295877a3d860de70f20513e7de9fee02c8d02911cf2f562e8bcf8f3b"
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
