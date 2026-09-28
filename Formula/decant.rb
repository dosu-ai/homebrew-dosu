class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.7.0/decant-darwin-arm64.tar.gz"
      sha256 "6fccdc7f81099f900c986d4dffeaf69d80cdba5c1a4ba2effde184bf59add7e3"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.7.0/decant-darwin-x64.tar.gz"
      sha256 "88b561ac11ddcd303b61ba15e86c4580a2cd7d0adbe20374305c926ee955606d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.7.0/decant-linux-arm64.tar.gz"
      sha256 "5cdf751e9f05c15a474b076fbc83432e6932ef4bb0733deff50f38960ead6c54"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.7.0/decant-linux-x64.tar.gz"
      sha256 "9627edb4b2f9cc043fba022235e6a569edf81e663d72f06f4f0e5d1492f229a3"
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
