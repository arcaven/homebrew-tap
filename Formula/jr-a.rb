class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260417.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260417.1/jr-a-darwin-arm64"
    sha256 "ecbedab10c5c42faab8c32d42accf32d21273c308ea08189744f917cc3110be1"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260417.1/jr-a-darwin-amd64"
    sha256 "892cd1639d8229d28a0f7d6d24d0c9c25501ffb0e8bd7f8fd8c12a330f59a8c1"
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
