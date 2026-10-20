class Loophole < Formula
  desc "Open-source AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/loophole-app"
  version "1.0.5"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.5/loophole-darwin-arm64.zip"
      sha256 "78f75f6c6ddcb1e2efca5a8f4798bbb303cf183c5cb0cb26637fdb99e63ba2fd"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.5/loophole-darwin-x64-baseline.zip"
      sha256 "4a89f9cc272e30ed58a034842be42388fea7e7a8da1831d3536e583b5f875217"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.5/loophole-linux-arm64.tar.gz"
      sha256 "dd89280c500cbafad279a9fdbc2ef5031d57655bf6ace0c4fbfc004cd247d769"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.5/loophole-linux-x64-baseline.tar.gz"
      sha256 "248869d19d59d42addf9ff376a625a444d1ca8e5bbe5e7ee4c498555c9f0b1bb"
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
