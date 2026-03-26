class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.4.0-dev.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.4.0-dev.3/jr-darwin-arm64"
    sha256 "cb25945201d31898e7a8f7a6271b89054cca7a0eb809cc5f41c8b642657b75c8"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.4.0-dev.3/jr-darwin-amd64"
    sha256 "e9e83c5436107309e61828973be63e21bd2c6762335e0afc25893c9282b37d2f"
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
