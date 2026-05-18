class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260518.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.3/jr-a-darwin-arm64"
    sha256 "7ac8125a95438af783d9d41693a25735c78b009298ddab3161ebd9b94593dc07"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.3/jr-a-darwin-amd64"
    sha256 "00d60befcd27235e4fa5b79b584f19cc2da95793d672e178aac3b7ecdeceb835"
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
