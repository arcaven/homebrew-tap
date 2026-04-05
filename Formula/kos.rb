# Homebrew formula for kos
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: download from GitHub releases.

class Kos < Formula
  desc "Knowledge Operating System — graph-based knowledge accumulation for designed systems"
  homepage "https://github.com/arcavenae/kos"
  url "https://github.com/arcavenae/kos/releases/download/main-20260405-060409-caeb7e4/kos-darwin-arm64"
  version "main-20260405-060409-caeb7e4"
  sha256 "67580001792294627dc01ba0b11c55b2ae32278b2850067d8ff931493f7f3ee3"
  license "Apache-2.0"

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
