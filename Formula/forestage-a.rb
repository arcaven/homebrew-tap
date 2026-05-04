# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260504-031403-acd3900"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260504-031403-acd3900/forestage-a-darwin-arm64"
    sha256 "7062304ee0bf5c58e205c40c898b2287d622dd1f6833ab4a92d5f186e1675494"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260504-031403-acd3900/forestage-a-linux-arm64"
    sha256 "6c2e232c309ee9fae206b94997777e284be18357b2d2a9f91f2033fb497f25d0"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260504-031403-acd3900/forestage-a-linux-amd64"
    sha256 "c68ed8b926ce9b4126d36de0f26679449bebec4abbdbfe7f9d4de76837baf98c"
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
