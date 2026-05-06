class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260506.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260506.1/jr-a-darwin-arm64"
    sha256 "8fa369d2b2ef71fd1ecbeb4e44ada8aeeae07e7df9cf308af7e7745830b6ae38"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260506.1/jr-a-darwin-amd64"
    sha256 "592a8d2fbb64949102f0bbbcc4de0a56918216c3bed8616825c93ef749711184"
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
