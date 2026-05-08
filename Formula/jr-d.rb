class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.8"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.8/jr-darwin-arm64"
    sha256 "d771faf0911acb0cd2cf56fa93388fa3a68b6cc0ec4ae2a3ef1ea7f854c01a3d"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.8/jr-darwin-amd64"
    sha256 "63875852a1b515f7534af78fee5bbb1d67e9e50a409efe68f5b39f31585413d7"
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
