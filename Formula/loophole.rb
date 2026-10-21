class Loophole < Formula
  desc "Open-source AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/loophole-app"
  version "1.0.6"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.0.6.tgz"
      sha256 "76b234995fbf279b85391ba388a2e149b82972eeb967aae076baf38c99d2bf8c"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.0.6.tgz"
      sha256 "73418e7295644142493b0b508e6a18619ca68ffdb0cd98dcb7185d4696a5595f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.0.6.tgz"
      sha256 "df696d0e3828f0cc7e029d51faf7d2bcea8b0dfc0f5015de37d2c88a45ffa498"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.0.6.tgz"
      sha256 "d80f26542bb33a4bda3e5c918ad1466483b656672fe23dd0900cb166ef3107ef"
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
