# Homebrew formula for kos
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: download from GitHub releases.

class Kos < Formula
  desc "Knowledge Operating System — graph-based knowledge accumulation for designed systems"
  homepage "https://github.com/arcavenae/kos"
  url "https://github.com/arcavenae/kos/releases/download/alpha-20260411-162802-3c901e1/kos-darwin-arm64"
  version "alpha-20260411-162802-3c901e1"
  sha256 "2b0dfb7cd0278bf7284056759d20835b311f02e81adc614322d54caaa4579e42"
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
