class Loophole < Formula
  desc "Open-source AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/loophole-app"
  version "1.0.6"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.6/loophole-darwin-arm64.zip"
      sha256 "d683b48d46609b6e640929cdae96faf5e4fb01466a92ed0cd568b85b09da7af2"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.6/loophole-darwin-x64-baseline.zip"
      sha256 "7ab4745f91a632157c0f571f9dfbb07b077202d1c26ba8a0b92c7254f52cbbda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.6/loophole-linux-arm64.tar.gz"
      sha256 "b9ea2eb020b1ca9b9afee9f09ff1f404c9fff3151fa3980b61a72ef7c88d2367"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.6/loophole-linux-x64-baseline.tar.gz"
      sha256 "4b583dc2252f1cab16ef83942fa73ae537405fbf862fd2aaa45a8a3c4ebeb9ff"
    end
  end

  def install
    if File.exist?("package/bin/loophole")
      bin.install "package/bin/loophole" => "loophole"
    else
      bin.install "loophole"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/loophole --version")
  end
end
