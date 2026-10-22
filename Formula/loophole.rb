class Loophole < Formula
  desc "Open-source AI coding agent for the terminal"
  homepage "https://github.com/loophole-ai/loophole-app"
  version "1.0.8"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.8/loophole-darwin-arm64.zip"
      sha256 "459078acf732074df9e43039e73c0d91d1a3cf22ca9df8d659507df59b946180"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.8/loophole-darwin-x64-baseline.zip"
      sha256 "8187c8a584b0c809d3a6dbc410d478c5d452d70419fcbe0d64293d3af10adad6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.8/loophole-linux-arm64.tar.gz"
      sha256 "7c0101437b69fa1c57be6a27bf731991def944d2e57fdb062cf76fb85e9c754c"
    else
      url "https://github.com/loophole-ai/cli/releases/download/v1.0.8/loophole-linux-x64-baseline.tar.gz"
      sha256 "51e2776f2985827f05792952ccf9abb2e869026570745cb4f2bd5a26da2b1af1"
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
