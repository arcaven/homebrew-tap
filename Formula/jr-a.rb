class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260420.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260420.3/jr-a-darwin-arm64"
    sha256 "ac27c607a57bb992426c167ade406bbcb7e07d1eeb1f680e6dc7d219dcfd49a3"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260420.3/jr-a-darwin-amd64"
    sha256 "5b1c51e144af8d37be1fbd9935eca87aee8821517cf104b55ffc253858c37f20"
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
