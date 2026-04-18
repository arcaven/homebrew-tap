# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260418-010252-6341c47"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260418-010252-6341c47/forestage-a-darwin-arm64"
    sha256 "4c2ac825c30d71fbfb42fb4bda9d44a6c89a61cc9956c0564f9b7c86e1e8554d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260418-010252-6341c47/forestage-a-linux-arm64"
    sha256 "0a6d927f30a208baac30d13de003bfa392ddcf0f39d92c932ca3985166ebabdf"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260418-010252-6341c47/forestage-a-linux-amd64"
    sha256 "d0c9ccb72926e654adff72f123eac5afa930fab366969ec4aad4a2a040603523"
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
