class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.11"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.11/jr-a-darwin-arm64"
    sha256 "236131cf3e70deafefef564ab037b8906637e7801a1c87f072747c151fd6f293"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.11/jr-a-darwin-amd64"
    sha256 "724918a6d8feb2dc24ca18526ae3b2f858c5d88a4954e5ce627cc4e17fc05ea7"
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
