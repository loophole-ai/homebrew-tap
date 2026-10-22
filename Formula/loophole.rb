class Loophole < Formula
  desc "Open-source AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/loophole-app"
  version "1.0.8"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.0.8.tgz"
      sha256 "5b1e9933933296d85488f4273b5e3c6dd3f463d6879f49662b5233cfd016df8d"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.0.8.tgz"
      sha256 "985bd202d2ffbccf883be3117935c3ba86c041b95657391965388432e7787193"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.0.8.tgz"
      sha256 "3faa56b35f9e4e514276e223d112297270d9efbfde6e77172c1f202422a22f72"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.0.8.tgz"
      sha256 "d4f2b5903f44569e7501a397062415eb31f375b5eecf9b1812bbce58528af793"
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
