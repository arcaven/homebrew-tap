# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260506-213538-e15e5ab"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260506-213538-e15e5ab/forestage-a-darwin-arm64"
    sha256 "20cb12a24c50f5aef57350ce5c2b2c32fb3f39df48815b37c1b9ad1dbf191b26"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260506-213538-e15e5ab/forestage-a-linux-arm64"
    sha256 "ee5bd0234ca2289f052e6becaf745a8577459ba0e8ff43178b18230e3ad3e80f"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260506-213538-e15e5ab/forestage-a-linux-amd64"
    sha256 "2dd5ec5ba884bab51fe5be1f95145351f2b559d8c1db84ce42b98e5678102791"
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
