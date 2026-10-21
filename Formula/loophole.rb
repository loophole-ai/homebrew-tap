class Loophole < Formula
  desc "Open-source AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/loophole-app"
  version "1.0.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-arm64/-/cli-darwin-arm64-1.0.7.tgz"
      sha256 "48028099ca7ca42e88eaa3b7bef55e6be99d8cd43847743a8e41e54116d06206"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-darwin-x64-baseline/-/cli-darwin-x64-baseline-1.0.7.tgz"
      sha256 "3b417d6f18e860e6c552052ae85b34854def5acf724ba18ccf44e84b8dea4928"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-arm64/-/cli-linux-arm64-1.0.7.tgz"
      sha256 "647e7f291a185314b6e125c2d377c25b6fed0c7061fdfa434b8ffea3775803cd"
    else
      url "https://registry.npmjs.org/@loophole-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-1.0.7.tgz"
      sha256 "3924e80db97089c9010404e687a5fb9d8e43662dd5b8edd9ac598e1d913eb44a"
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
