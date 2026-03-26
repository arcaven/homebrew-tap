class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260326.8"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.8/jr-a-darwin-arm64"
    sha256 "2145a5ba6f97fd62afe6f48f5905c3be65cc7cef71fa351288d6cd535f8ceb1d"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260326.8/jr-a-darwin-amd64"
    sha256 "5be5de73a1ce8bc750f64dabfb43f08ae6bf0809963bbac294401adcdf297582"
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
