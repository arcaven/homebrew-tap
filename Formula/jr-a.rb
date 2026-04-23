class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260423.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.3/jr-a-darwin-arm64"
    sha256 "da6afddb29b184ca68202f51a243af743a151cd45803d0ee6f6a7b8979eebfab"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260423.3/jr-a-darwin-amd64"
    sha256 "bbcfd2dffe7f65ac724d739d15c807da5ffd99b8a0b4d3d2726e0afaa5d5999f"
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
