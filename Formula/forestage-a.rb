# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260419-051356-07c1b59"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-051356-07c1b59/forestage-a-darwin-arm64"
    sha256 "f98ce523f14597cc828f1c570040272c0dfed43a11d0deab0420461964adfe93"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-051356-07c1b59/forestage-a-linux-arm64"
    sha256 "b1dac0dfb73147b8b140a01bc0f288dbdb3c7ce61047e18ea3f67f90165ef7e9"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260419-051356-07c1b59/forestage-a-linux-amd64"
    sha256 "ca6d51085a02b6f2a981f7a3c4adbce24ec36b6a6be4db5ee5b33944d52f80ec"
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
