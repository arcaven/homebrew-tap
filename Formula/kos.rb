# Homebrew formula for kos
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: download from GitHub releases.

class Kos < Formula
  desc "Knowledge Operating System — graph-based knowledge accumulation for designed systems"
  homepage "https://github.com/arcavenae/kos"
  url "https://github.com/arcavenae/kos/releases/download/alpha-20260406-140618-00cb4c9/kos-darwin-arm64"
  version "alpha-20260406-140618-00cb4c9"
  sha256 "b33a87dd8dcf56e66a34f5bf7311f97443268196e56fd8dc718b18d94196a928"
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
