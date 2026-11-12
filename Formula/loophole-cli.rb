class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.6"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.1.6.tgz"
      sha256 "e09104ce61e0614040e395988d46a4c100158a13c849a0a533d3412ae794ed02"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.1.6.tgz"
      sha256 "bc9d6113afb8c7a8ef8a6ef3283330727dfb5b2a05ab4001e52c604097532839"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.1.6.tgz"
      sha256 "a77aecfafe81293403c4d5c5e7a026ea6c3edd2d0ee11511feaf7f676e9b2f77"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.1.6.tgz"
      sha256 "4ca67b1262d6b8710a5d668acc257f7bbcd0907601314f417b25b62d49d6b476"
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
