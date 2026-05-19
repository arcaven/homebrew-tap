class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260519.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260519.3/jr-a-darwin-arm64"
    sha256 "4b79a70de1a0ba8d0cebcf4cc1404225b2357e3dae84930f37b9890ebf7e2721"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260519.3/jr-a-darwin-amd64"
    sha256 "f31ebedfd8b05fd96f5a123c4a4ddd5f2d6085df87c8cb5729c6a3a52324c555"
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
