# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: use install.sh or build from source.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  url "https://github.com/arcavenae/forestage/releases/download/alpha-20260416-020408-2851c83/forestage-a-darwin-arm64"
  version "alpha-20260416-020408-2851c83"
  sha256 "86dee065796390d84cccff2ca1063c1676ece1c93c2a32890e31d1d4f45b0381"
  license "MIT"

  def install
    bin.install "forestage-a-darwin-arm64" => "forestage-a"
  end

  def caveats
    <<~EOS
      forestage-a is the alpha channel. Updates on every push to main.
      For stable: brew install arcavenae/tap/forestage
      Requires Claude Code CLI (claude).
    EOS
  end

  test do
    assert_match "forestage", shell_output("#{bin}/forestage-a --version 2>&1")
  end
end
