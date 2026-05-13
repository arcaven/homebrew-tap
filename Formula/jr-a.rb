class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260513.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260513.1/jr-a-darwin-arm64"
    sha256 "e344f1b72109ef412619d69a3c6ed229a7b979ea71937e480ba72edc9f096754"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260513.1/jr-a-darwin-amd64"
    sha256 "b2627fa88338420a78a4f6c9f255a177c9a00f4311942df3946bc96498eb22e0"
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
