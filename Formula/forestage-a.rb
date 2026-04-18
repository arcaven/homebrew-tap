# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260418-050527-3a316b0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260418-050527-3a316b0/forestage-a-darwin-arm64"
    sha256 "0fef1aba7e6c5144e4bf47754c203891b9e8000e6f59933f983589013992036c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260418-050527-3a316b0/forestage-a-linux-arm64"
    sha256 "b0a1dc9f0273812c758219d08abbde72d81fd18f50934b53ae14e4d2a45a055c"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260418-050527-3a316b0/forestage-a-linux-amd64"
    sha256 "2bc951d726e7d006295ba22427b9cac61ca039fc30fcaa5eb1257845c24fd2db"
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
