class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260509.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260509.4/jr-a-darwin-arm64"
    sha256 "f09d70e976c4b17f47e4fe514366a254179152948099434e51cc9daaf7c67fdc"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260509.4/jr-a-darwin-amd64"
    sha256 "a91277f8199c1ea78942e9d6c66def3baf9b2496c8e602fc01c9372ce55993d6"
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
