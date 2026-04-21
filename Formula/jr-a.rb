class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260421.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260421.3/jr-a-darwin-arm64"
    sha256 "f22f1c7e221733ed3c5aa73322b7607ee4fc0160dada20c8e5516a6c225fa8b1"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260421.3/jr-a-darwin-amd64"
    sha256 "5fec44c01b20592bee127db3f01ce495603d6979bfecb3fc8173ef44472abd37"
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
