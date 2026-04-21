class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260421.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260421.4/jr-a-darwin-arm64"
    sha256 "a8ad86e42bbcdcf2fdb8f407c211281d6f79e1f0c11650e8585f741869f1243f"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260421.4/jr-a-darwin-amd64"
    sha256 "8158b51324e7b4574520fd2f932c679f0ed0cc9088d95a2302b2608b1be932a6"
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
