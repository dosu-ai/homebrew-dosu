class Decant < Formula
  desc "Analyze AI coding agent sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.13.0/decant-darwin-arm64.tar.gz"
      sha256 "b513f942da97327e2c137f87014fb7c40af1f36aad21a8fa8ee83065cce341a1"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.13.0/decant-darwin-x64.tar.gz"
      sha256 "44b63aa2b36b506e2de4cd408030af74a9a62b7983dcf403f8a824d03a9b3320"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.13.0/decant-linux-arm64.tar.gz"
      sha256 "f4cc46c1939a8799a62e46601e5bfa9a948d64591fe624667d42e7423d9333de"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.13.0/decant-linux-x64.tar.gz"
      sha256 "ca57936e0dd2da70ecd86da2058431344fe76b0abfe05b86c989461fa1523757"
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
