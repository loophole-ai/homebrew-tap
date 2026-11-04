class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.1.0.tgz"
      sha256 "07c7acfb6946675257550f55266d665fd810eb330e7388bfbfc6d2a8a173149d"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.1.0.tgz"
      sha256 "4243353c6a889b192bb096d1ddf1c087793053bfd075a3953c8a97bffa7d75bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.1.0.tgz"
      sha256 "e436f263401aebe862906dcb595ed29b99f7dda99e4aab04f7af3df1ad81bc32"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.1.0.tgz"
      sha256 "e6e72d0132918d63e5d9012fa45f2d42ce5e272c15c45746038b9021408f39c4"
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
