class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260420.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260420.1/jr-a-darwin-arm64"
    sha256 "bb2fcf077cbef6a8a0db0ce405dfda7b9948fe1b2904ae845a6873a77ddf08f9"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260420.1/jr-a-darwin-amd64"
    sha256 "bd7732b6434789c39335eba7ffb6bbd6be1b1843fd76d80ccc51fade6c0f2106"
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
