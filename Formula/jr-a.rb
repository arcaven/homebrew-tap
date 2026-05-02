class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260502.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260502.4/jr-a-darwin-arm64"
    sha256 "130f8a4449b74a986e5d4538f65999d98ad99f80b01580573e9c28eca9f55552"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260502.4/jr-a-darwin-amd64"
    sha256 "12707489304367e35be2f71c34d8ddb3c72f45bcf7af507fc6cd2f471c15ba3b"
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
