class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.1.5/loophole-cli-darwin-arm64.zip"
      sha256 "89e08eb6e918e0b86a55d143085c2771147d0c93e03f0d17345e393277bc5e16"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.1.5/loophole-cli-darwin-x64-baseline.zip"
      sha256 "8fc44465fd71ed9c67adaedc2a5117db150715369a43697b58a322e5c76a5194"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.1.5/loophole-cli-linux-arm64.tar.gz"
      sha256 "0c3de10794275b37b332ebea81a0ef5213c029833eced25f24dbf23a1f2ec148"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.1.5/loophole-cli-linux-x64-baseline.tar.gz"
      sha256 "14cb1d2badb1ee454a1eb4c0147900589b15880e13a80a606416c6537389c982"
    end
  end

  def install
    if File.exist?("package/bin/loophole-cli")
      bin.install "package/bin/loophole-cli" => "loophole-cli"
    else
      bin.install "loophole-cli"
    end
    bin.install_symlink "loophole-cli" => "lhc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/loophole-cli --version")
  end
end
