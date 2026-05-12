class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260512.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260512.3/jr-a-darwin-arm64"
    sha256 "c9cb58f7f592f71b5107e1a97ef7c49cec57c7d1e8dffc581359b30991f92801"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260512.3/jr-a-darwin-amd64"
    sha256 "f5287b61df7a7f536f3a075b24773b12fe653df90a2efde0d8b73aa602af9fa1"
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
