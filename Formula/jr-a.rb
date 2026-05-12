class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260512.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260512.2/jr-a-darwin-arm64"
    sha256 "3751034218539b24b7cc026e544dd703f5b0691e098525cc131fb6a3ec0c68b4"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260512.2/jr-a-darwin-amd64"
    sha256 "bc87e2be260ef1a14de4ed6103601faccbf0dc7d0c32bd35408cdc8e96c9cf78"
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
