class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260419.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260419.2/jr-a-darwin-arm64"
    sha256 "9648a8d4336a9b7806b66cd34a308f09e2946257fc80db353697ccf595b7bdaa"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260419.2/jr-a-darwin-amd64"
    sha256 "8ba58dc763be1599e4ed994cff7323be189619c95b2ba4b85a8149a2fa6a9767"
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
