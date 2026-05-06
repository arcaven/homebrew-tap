# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260506-201012-e04aacf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260506-201012-e04aacf/forestage-a-darwin-arm64"
    sha256 "4a3f66d28c71eaa37d9fc15a98e2ac1b1457163635033e137b7ea309a4125b7c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260506-201012-e04aacf/forestage-a-linux-arm64"
    sha256 "1ae42892755699c0103ad2ce983150e3bc8db975622e1d41de7a08ed4376ffb5"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260506-201012-e04aacf/forestage-a-linux-amd64"
    sha256 "b5fa07806726ab955c89195352bd80871d944d7cdebea313b569f938c6730c97"
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
