class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha ch)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260422.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260422.1/jr-a-darwin-arm64"
    sha256 "74fc8fb53daf9d2af321a3d158f785febd24808dabc80ff6cb861c3050a8f673"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260422.1/jr-a-darwin-amd64"
    sha256 "55b62970a4c658bbc00458816dee5d2090650a669e3f1621f96d283c20624578"
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
