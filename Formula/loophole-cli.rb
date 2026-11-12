class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.1.5.tgz"
      sha256 "e187832ae6a613166fee336067dca242e0add66f2cbb0a3580b55c445df9a796"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.1.5.tgz"
      sha256 "a46e67e7076fc2ea8d2ae5501f0598e8c49e72ab2fe6abfbe8cce57ac1afefc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.1.5.tgz"
      sha256 "e98bd5c1adeca784724d6882281ee6f206fabe951125dd5e6cb426cbc89ff60a"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.1.5.tgz"
      sha256 "dfa0f388dc3ca50b5f362ee26bf628c50d3157d40837d1613b23fb9cdb830a3c"
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
