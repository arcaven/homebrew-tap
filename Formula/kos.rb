# Homebrew formula for kos
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: download from GitHub releases.

class Kos < Formula
  desc "Graph-based knowledge accumulation for designed systems"
  homepage "https://github.com/arcavenae/kos"
  url "https://github.com/arcavenae/kos/releases/download/alpha-20260412-030749-2709334/kos-darwin-arm64"
  version "alpha-20260412-030749-2709334"
  sha256 "687e28ddba78927d4eb5735060d94f68c8300eb73688f63b5d1ddbb9303ba644"
  license "MIT"

  def install
    bin.install "kos-darwin-arm64" => "kos"
  end

  def caveats
    <<~EOS
      kos updates on every push to main.
      Self-update: kos update
    EOS
  end

  test do
    assert_match "kos", shell_output("#{bin}/kos --version 2>&1")
  end
end
