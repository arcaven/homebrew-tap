class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260424.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260424.1/jr-a-darwin-arm64"
    sha256 "e19b78dd52279859234d811bcf77d1174ce917da89406515fdf5262b871e4bee"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260424.1/jr-a-darwin-amd64"
    sha256 "f1b22c8e5e9575d8b31caaffab12d95a43c0ed6612aa60017e93a4ac115403da"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-a-darwin-arm64" : "jr-a-darwin-amd64"
    bin.install binary_name => "jr-a"
  end

  def caveats
    <<~EOS
      jr-a is the alpha channel. Updates on every push to develop.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-a --version 2>&1")
  end
end
