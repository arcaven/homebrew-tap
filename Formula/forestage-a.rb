# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260417-210105-3a1318e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-210105-3a1318e/forestage-a-darwin-arm64"
    sha256 "e57ca0c8cbb6f5c5a29a0a639aa23342d8eccab14c5f216143399bfacfe87c45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-210105-3a1318e/forestage-a-linux-arm64"
    sha256 "ae4a4a47b8589e30a608b364e487cc54f74771af655b96c255cec8c616ef1ff5"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260417-210105-3a1318e/forestage-a-linux-amd64"
    sha256 "6fc32331bc785e70a6089a1eaa6aa612a6ff97070d37b49a5b551720cc1a18a1"
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
