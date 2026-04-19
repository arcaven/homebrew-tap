class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260419.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260419.1/jr-a-darwin-arm64"
    sha256 "5280cc6faa0dd7533974071ca6a627b7065202f862294dcc16062adb360a2af9"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260419.1/jr-a-darwin-amd64"
    sha256 "9d77f533d697840dc5f914a15843ebbd6b28587e1ebb6d00299c66786369301d"
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
