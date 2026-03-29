class JrA < Formula
  desc "Fast, keyboard-driven Jira CLI with offline support and fuzzy search (alpha channel)"
  homepage "https://github.com/arcavenae/jira-cli"
  version "alpha-20260329.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260329.1/jr-a-darwin-arm64"
    sha256 "e3b8ad37e76923dedf2bfd97e1455f1b2c0166dfa0a21c084a1bf5ff2b2656b9"
  else
    url "https://github.com/arcavenae/jira-cli/releases/download/alpha-20260329.1/jr-a-darwin-amd64"
    sha256 "257dbb4bdfa2ca1d8223373e09adc953550da85a7fca50c6321216fa247241aa"
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
