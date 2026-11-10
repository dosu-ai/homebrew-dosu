class Decant < Formula
  desc "Analyze AI coding agent sessions: tokens, context windows, and cost"
  homepage "https://github.com/dosu-ai/decant"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.14.0/decant-darwin-arm64.tar.gz"
      sha256 "05b79f03809bbdd451d30351291bc4e1b546a8d1498f19b833b4967848c8c723"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.14.0/decant-darwin-x64.tar.gz"
      sha256 "f032c371a7ffd9d35e0ee17a758367ab394f67d70c68823ffa00e34e019b50a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dosu-ai/decant/releases/download/v0.14.0/decant-linux-arm64.tar.gz"
      sha256 "699d92338442c99021a9d0fb8f6235466cfada758a6db11f690d89de1a2ff365"
    end
    on_intel do
      url "https://github.com/dosu-ai/decant/releases/download/v0.14.0/decant-linux-x64.tar.gz"
      sha256 "116531809606201c90c5bc712471d7b3be2debd10ca440ce158a276ad7ae0196"
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
