# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260417-215852-6c49d6d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-215852-6c49d6d/forestage-a-darwin-arm64"
    sha256 "e64e26b34450e1b1830e0cd601cc22325282bfbcf4defc372dd50d145c9501fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-215852-6c49d6d/forestage-a-linux-arm64"
    sha256 "f496f105e06817217dcc6965b6c95504233c4ef3de5c1857faf091e42b637097"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-215852-6c49d6d/forestage-a-linux-amd64"
    sha256 "df332498569682a5c3c125d3fd5f8279e7e56628a6fc85b0cb1247c5459d2293"
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
