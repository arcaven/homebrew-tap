class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260518.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.4/jr-a-darwin-arm64"
    sha256 "f7a67fd7d99833aa9c94e534b45b207d4e0a8ad3604dae38753d88b3772ceeed"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260518.4/jr-a-darwin-amd64"
    sha256 "fbccd310ffb3d4d2a81f384777f39fd314763ebb9e81ed13bc98187dceef5e79"
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
