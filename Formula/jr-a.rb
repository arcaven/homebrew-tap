class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.10"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.10/jr-a-darwin-arm64"
    sha256 "a2f9fc1f00e66ab2ddcd0618190d0513d772941a0cb8bc324920797bba87b213"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.10/jr-a-darwin-amd64"
    sha256 "9242aa79bde311ab1f11bdc244d3c578e2c7817c5153979c7a15c2f35dd82462"
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
