class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260507.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260507.1/jr-a-darwin-arm64"
    sha256 "d218c05ad99474e152311dc64da01ce6fc93e76e88fdb322d56676ee1cdd5a73"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260507.1/jr-a-darwin-amd64"
    sha256 "da6c3039b28a0d7110ebd6f7946049c7cc5eb9d0eff89479cc8bc9067f2d8e79"
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
