class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.9"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.9/jr-darwin-arm64"
    sha256 "da82b1e288421764732f3f9cd5221ba0946454d2ab624b0afcf5ca5789b0a109"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.9/jr-darwin-amd64"
    sha256 "810bd9a6e360c587c64f13d8795e875e04a13e28ed9f584f9fc56bf8e349e453"
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
