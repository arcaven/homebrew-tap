class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260329.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260329.2/jr-a-darwin-arm64"
    sha256 "78fe66635023934e6a72ed293cefb7f76aeda08510042e71461171deaf8cbab2"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260329.2/jr-a-darwin-amd64"
    sha256 "ddf4241c489590635d506da4b158983f4aee583507ce7cff58363e0f5a426359"
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
