class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260401.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260401.1/jr-a-darwin-arm64"
    sha256 "61843c2687767b2fea7eb569d4f94fb2fc0240c5a76f29cc130000dd7db36674"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260401.1/jr-a-darwin-amd64"
    sha256 "4071d1a29473538fc62e33b6496b3ffc89031f523373960b247c3709252ba139"
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
