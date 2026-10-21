class Loophole < Formula
  desc "Open-source AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/loophole-app"
  version "1.0.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.7/loophole-darwin-arm64.zip"
      sha256 "bfab740ce41667974bffd4e63cefe71135817f3221c7dfff1e173dd6da71f2e3"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.7/loophole-darwin-x64-baseline.zip"
      sha256 "427530f0583f024ad5cab5977ee72a05983823f008e56d0b95bc814505e11385"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.7/loophole-linux-arm64.tar.gz"
      sha256 "2bce0a53421a2f7a5c6fe60ae364905c187c7a250553091a269e92e261d3bae5"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.7/loophole-linux-x64-baseline.tar.gz"
      sha256 "07d8b5ce025503490acc4699cf077078cda7b879dc20d2633e1a4ba2c92aa804"
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
