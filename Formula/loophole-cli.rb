class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.7"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.1.7.tgz"
      sha256 "a1ab34aa164875d17a68d3e9828d1ef9e8fafb7561b0852e3369b629bd170905"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.1.7.tgz"
      sha256 "65dcf048bb0675b87adb44532060eeb271122f7eb304e59f2e2903a0d1527c34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.1.7.tgz"
      sha256 "596442f5c177c29d0d7d1284d39a28d171d857e8b85a5b7a2f1181e49166bb81"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.1.7.tgz"
      sha256 "be719d13c280336d09814654c6bc039ad415028541e19ef9d4ab78e906dcab1a"
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
