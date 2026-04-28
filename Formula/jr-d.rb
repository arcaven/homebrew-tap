class JrD < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (dev ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "0.5.0-dev.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.4/jr-darwin-arm64"
    sha256 "ccdb38ea15aae640b334a93ef69e8142f05a07b0c34411a1215f76c098eca5c1"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/v0.5.0-dev.4/jr-darwin-amd64"
    sha256 "d449beb6aa54bc92689e296bd9aed5261972db777b412a95780206297a680853"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "jr-darwin-arm64" : "jr-darwin-amd64"
    bin.install binary_name => "jr-d"
  end

  def caveats
    <<~EOS
      jr-d is the dev channel. Updates on every v*-dev.* tag.
      For stable: brew install arcavenae/tap/jr
    EOS
  end

  test do
    assert_match "jr", shell_output("#{bin}/jr-d --version 2>&1")
  end
end
