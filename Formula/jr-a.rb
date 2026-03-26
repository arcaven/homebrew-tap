class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.3/jr-a-darwin-arm64"
    sha256 "9581f1e07d64285807771e75e47e020df7d7e0f6a6917f5559cdf30e7e9bf589"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.3/jr-a-darwin-amd64"
    sha256 "82d4a2bfd0bd38ae7b7e364137b51966b52651a33384338136246957ac520da3"
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
