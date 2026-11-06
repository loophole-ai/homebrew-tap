class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.1.3.tgz"
      sha256 "4df3bfbdc1591d0a2d116b9770771cdb0d49881560d2f3bb7931576402f55518"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.1.3.tgz"
      sha256 "5bcf821beb89783cf8681666f9f378dc7beaff1db3e2fd9558e1332530e0ed29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.1.3.tgz"
      sha256 "f9d195e568ca3d1eb40c30c8b5791a636d027cc1392dda2b26986cd7b4c1804f"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.1.3.tgz"
      sha256 "7cd8c08f0d9059dfe6c8847ae3adf891ef1f270c2a10d090b6473f542a04cc82"
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
