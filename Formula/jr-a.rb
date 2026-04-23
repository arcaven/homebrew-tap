class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260423.5"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.5/jr-a-darwin-arm64"
    sha256 "016276c15cbf6e27c5e6506ca482ae47b9a071ecc30ce9ea002eb9db9ac6376e"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.5/jr-a-darwin-amd64"
    sha256 "32f55fd47de416def3216bcbdbd293284958117a2d0aaeb2c2b5db6b33b7e162"
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
