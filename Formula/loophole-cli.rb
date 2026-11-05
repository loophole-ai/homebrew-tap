class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.1.1.tgz"
      sha256 "0fcb0816f5d6400e8c979a1d974c44d8960d162bb954c54213b5d2b841973746"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.1.1.tgz"
      sha256 "00819659a971fe093615c60aa8acc11ca7fd1797f7ec23108f00eba132f110ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.1.1.tgz"
      sha256 "4a886b14aceb3f3142fb8f83aae33ad099f8be128bd8d10d747ca13b1247f325"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.1.1.tgz"
      sha256 "5fe5337131a9b7c2d70612c789a2f8ba06fbb4ccc606696d94dc068b090c4301"
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
