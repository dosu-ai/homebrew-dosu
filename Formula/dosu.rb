# typed: false
# frozen_string_literal: true

class Dosu < Formula
  desc "CLI tool for Dosu"
  homepage "https://github.com/dosu-ai/dosu-cli"
  version "0.34.0"

  on_macos do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-x64-homebrew.tar.gz"
      sha256 "9d8dfd173069e1325866e09e6706f377b9e64ecc8f25cc26ac7ec4fbed755355"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-darwin-arm64-homebrew.tar.gz"
      sha256 "b398a47362579dc0085642bc0b6124860436d1c5bcc141d2967739634d8a5fb4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-x64-homebrew.tar.gz"
      sha256 "6dec5277a76fd85e60ce6890b81d2c79e2a86c6f20c068694e7ea1c38c78f904"
    end
    on_arm do
      url "https://github.com/dosu-ai/dosu-cli/releases/download/v#{version}/dosu-linux-arm64-homebrew.tar.gz"
      sha256 "700ca6bc982d2d85cd612452a752f13c198cc46e761b43a7451cf48310ece22a"
    end
  end

  def install
    executable = if File.file?("dosu")
      "dosu"
    else
      Dir["dosu-*"].find { |path| File.file?(path) }
    end

    odie "Could not find a dosu executable in the extracted archive" unless executable

    bin.install executable => "dosu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dosu --version")
  end
end
