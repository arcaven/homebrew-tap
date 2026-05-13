class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260513.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260513.2/jr-a-darwin-arm64"
    sha256 "0b5302955f7966071b41743edaeefa4f6bc9668ee15b0cc679fb7a9c817a0592"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260513.2/jr-a-darwin-amd64"
    sha256 "e5082abdbefc4720d4260dcc16b104a5811410a82c69d26c7016d10b311f8472"
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
