# Homebrew formula for kos
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: download from GitHub releases.

class Kos < Formula
  desc "Graph-based knowledge accumulation for designed systems"
  homepage "https://github.com/arcavenae/kos"
  url "https://github.com/arcavenae/kos/releases/download/alpha-20260502-233013-dbd529b/kos-darwin-arm64"
  version "alpha-20260502-233013-dbd529b"
  sha256 "7ce91aa31ef4f2842a418b928bbd1c9f29512155ec98c09346ac2b24c12d032e"
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
