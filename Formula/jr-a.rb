class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260518.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.1/jr-a-darwin-arm64"
    sha256 "630374c9ca2a54fe74541b0ea2113d931ef0819705436cf4246af25288debaf3"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.1/jr-a-darwin-amd64"
    sha256 "26441003e3bdcc29cecbf777c95cf2c412e17569055de92f49ed1b4ff5fd21f7"
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
