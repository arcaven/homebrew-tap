# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260426-202713-b9ef0e2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260426-202713-b9ef0e2/forestage-a-darwin-arm64"
    sha256 "4f1117358d0c3aff3c64938a4f911b0e942e4875964fd64f5385c4be456fab77"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260426-202713-b9ef0e2/forestage-a-linux-arm64"
    sha256 "4548da383b7eb7ddd35407056d533c9cedff699cb25527ead3483f2f717ccbde"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260426-202713-b9ef0e2/forestage-a-linux-amd64"
    sha256 "4e659a7a7d9e66773ef9ae755c7d498639c8df0b55c3678a409069bbdd6fd92f"
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
