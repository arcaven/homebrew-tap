class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260511.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260511.1/jr-a-darwin-arm64"
    sha256 "c7b46fdb04350831d41abb6b14976922eafdec4fed0b19a014f86b0d572cc7a0"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260511.1/jr-a-darwin-amd64"
    sha256 "47ed758cc3474ed064c289b97232852716b4724ea35db1655bf9a8f0a4597340"
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
