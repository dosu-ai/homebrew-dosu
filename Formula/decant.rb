class Decant < Formula
  desc "Analyze Claude Code and Codex sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.2/decant-darwin-arm64.tar.gz"
      sha256 "37e449b43805ccdfa9009a9776317d5246f32ac559867767eba78d990ac13a79"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.2/decant-darwin-x64.tar.gz"
      sha256 "1ca98388ddc35658aa4b1f5797ac75dbfa3d36f1185c41f7e14dcf6dbf347ade"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.2/decant-linux-arm64.tar.gz"
      sha256 "406119c8770238bfbed025e21636bc7256ffc8825ae609cd966c57c78798b966"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.10.2/decant-linux-x64.tar.gz"
      sha256 "3575283e069b8789acfaa2907d04641f34354ae664608e9f63f30eb77b234252"
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
