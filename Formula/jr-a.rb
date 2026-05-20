class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260520.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260520.3/jr-a-darwin-arm64"
    sha256 "15c554965e48b448343bd9e29d2dbfd18b01a07bc44a7f4032d8bbed75ef47b6"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260520.3/jr-a-darwin-amd64"
    sha256 "1c19556b4c96d29ce379e4bde2ce7adeb0113189d8dd3b9b9c306addc9b7054b"
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
