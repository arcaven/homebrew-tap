class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260509.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260509.3/jr-a-darwin-arm64"
    sha256 "a2a728c250d7a82b9f68434f97546b422b384441fb07343ad99e563331f832b9"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260509.3/jr-a-darwin-amd64"
    sha256 "7fd370ecdde69966aeb2ef5e5427fb8911e49c4b05f4fb812e50ea132338189f"
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
