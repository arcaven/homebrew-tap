class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.5"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.5/jr-darwin-arm64"
    sha256 "da7a8709ba8c2ac57aadfbfeb86698a530f179923c12b944a36a7dd2f664f8e5"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.5/jr-darwin-amd64"
    sha256 "1685b20dbe47f997f48c4e1096333fc901430ec97817c5a46bbdcb34b02691e7"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
