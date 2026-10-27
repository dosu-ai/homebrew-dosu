class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.12.1/decant-darwin-arm64.tar.gz"
      sha256 "b1e1b27c64d9649e687b2dceb43e73c84106bfa13f9ace8de4b6dcf6b8aff97e"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.12.1/decant-darwin-x64.tar.gz"
      sha256 "204e62f4b628298ecd01b4fe287ed00caf98ccf616241dda1511695347848472"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.12.1/decant-linux-arm64.tar.gz"
      sha256 "fff90f58e13698a69723848728d27245a4365374d15324448b69baf5f4c038a3"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.12.1/decant-linux-x64.tar.gz"
      sha256 "de1f92004d43729dc6c5bb491980589ee8781eb407814fd338f4047558953654"
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
