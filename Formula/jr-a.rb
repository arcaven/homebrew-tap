class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.7"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.7/jr-a-darwin-arm64"
    sha256 "ad03f8e81f17c0175ac35e50e84a20e88d401bdbb129811a6fc297a9afec4598"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.7/jr-a-darwin-amd64"
    sha256 "c36a6dbce020943ccab1489a95756245d5f0a688f652a6c29f6950cc58c0bfc9"
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
