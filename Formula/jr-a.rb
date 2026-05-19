class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260519.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260519.1/jr-a-darwin-arm64"
    sha256 "76f5ac9ced384eab5709a936bbd92caa7be2a9f7e4979fa68766e663bff7f9ff"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260519.1/jr-a-darwin-amd64"
    sha256 "82eba2512605efae36a759d19f7eec585a3663cea36d4d7def7f39559a5eff74"
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
