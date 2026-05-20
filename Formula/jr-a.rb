class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260520.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260520.1/jr-a-darwin-arm64"
    sha256 "d9d0faa0c15522d0f61b042d64c9364e0d827a32af628f6152bf656e5ef389b3"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260520.1/jr-a-darwin-amd64"
    sha256 "d88076f2ea79584e22b141cc57b8d75cdb1e8c2f97c59da709f0227a79a54561"
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
