class LoopholeCli < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/cli"
  version "1.1.6"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.1.6/loophole-cli-darwin-arm64.zip"
      sha256 "8d14c47bc8c355e4e8fd8cbaa577c013b44880bb337c9ffe6c4bfcf1de7a9372"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.1.6/loophole-cli-darwin-x64-baseline.zip"
      sha256 "6c45f65a17197300de5845bc5f56b5e5dd0d779505e79010b275e6d05d2ed48d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.1.6/loophole-cli-linux-arm64.tar.gz"
      sha256 "e7327c204b61415361504932ecfd2cc09f789c7cf5ea34f037948d49259ea832"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.1.6/loophole-cli-linux-x64-baseline.tar.gz"
      sha256 "f4ac5afbf7337ea029d05e7c1948c2b0e7b1a3361c04652ba152b959b5498b8c"
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
