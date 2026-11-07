class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.1.4.tgz"
      sha256 "927165588910724849ff29f5ed01c2cc6d4e46359ed40942a210743d03374a07"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.1.4.tgz"
      sha256 "7b5ecb9418e73f1fe83d5d145dc536038bec8509ea4d66681a4b7b34ddf9a74a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.1.4.tgz"
      sha256 "e5a96f4ba2e8a47fe037471878683b7c11d425d9bbc9d98e8c0048b40c9e9c1d"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.1.4.tgz"
      sha256 "889be6c60378a20ad26518fd26fda88ee3865ee162c3eb8d1d0c36e27e66fab0"
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
