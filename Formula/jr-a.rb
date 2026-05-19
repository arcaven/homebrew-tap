class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260519.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260519.2/jr-a-darwin-arm64"
    sha256 "47d9e82d5112d6d0e8c6702c20eead2650516e7faa7767cc03967a9f1f66b6ee"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260519.2/jr-a-darwin-amd64"
    sha256 "d4323196932d66981be529b6c0f9b5919a11995284ab0e77d1b1aeafc5da980c"
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
