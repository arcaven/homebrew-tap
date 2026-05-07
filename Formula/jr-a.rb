class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260507.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260507.2/jr-a-darwin-arm64"
    sha256 "b29496c457fadf6b60edbeae724bebbe6c506298a177edd818e5300c682468a6"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260507.2/jr-a-darwin-amd64"
    sha256 "0a292e037aea22a01e89b8e1fa32ca301cb3d5a594c0842aadf31f8c03400eaa"
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
