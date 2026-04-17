# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260417-223547-4c4e28a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-223547-4c4e28a/forestage-a-darwin-arm64"
    sha256 "1b6f03d1748e37d7678aabd14a6121b9215720b11374e37f8c80a21f113a0997"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-223547-4c4e28a/forestage-a-linux-arm64"
    sha256 "1d1fe38e4c3d8c0d7811c3341a73168b71795368304d56f82961ea9faec5af4a"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-223547-4c4e28a/forestage-a-linux-amd64"
    sha256 "e2a6d204a6cdda60735835a028e4f98194a2577d407fbf6a69db741fb3130284"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "forestage-a-darwin-arm64" => "forestage-a"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "forestage-a-linux-arm64" => "forestage-a"
    elsif OS.linux?
      bin.install "forestage-a-linux-amd64" => "forestage-a"
    end
  end

  def caveats
    <<~EOS
      forestage-a is the alpha channel. Updates on every push to develop.
      For stable: brew install arcavenae/tap/forestage
      Requires Claude Code CLI (claude).
    EOS
  end

  test do
    assert_match "forestage", shell_output("#{bin}/forestage-a --version 2>&1")
  end
end
