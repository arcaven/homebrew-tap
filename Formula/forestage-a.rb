# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260424-162950-c427c9f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260424-162950-c427c9f/forestage-a-darwin-arm64"
    sha256 "e6e11ab9c0a5f0438fcece1c214a16c02efa879741c41262eef99bd29e1d687a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260424-162950-c427c9f/forestage-a-linux-arm64"
    sha256 "2588d0a3abf2683f2ee5efc710ebb22de863909a0fd743efcbba878e6d07fd05"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260424-162950-c427c9f/forestage-a-linux-amd64"
    sha256 "bebd4bc3107e000b72a5152d7495fb75944d4609c0ebc7b37941329dc391e4c3"
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
