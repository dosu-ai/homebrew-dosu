class Decant < Formula
  desc "Analyze AI coding agent sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.13.1/decant-darwin-arm64.tar.gz"
      sha256 "e1b2f2043a6cfa53c29223cc43945f2a72eeece1177f6d35d5ad460c68fef756"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.13.1/decant-darwin-x64.tar.gz"
      sha256 "f4691cfb3e94e4af24f4b83bafda247ddda570b371cb68b97d7e02f422ca4474"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.13.1/decant-linux-arm64.tar.gz"
      sha256 "83de13bf771f3017fdf438bf317fb9d604c78c710b610f5532fbda9cbeebdad2"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.13.1/decant-linux-x64.tar.gz"
      sha256 "9b01f8c325400adfdff697532403525cfe4aab29a7ce20939b589b6e9e55e831"
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
