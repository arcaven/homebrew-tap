# Homebrew formula for forestage-a (alpha channel)
# Updated automatically by CI on every push to develop
# macOS (arm64) and Linux (amd64, arm64) supported.

class ForestageA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcavenae/forestage"
  version "alpha-20260426-211943-10801bc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260426-211943-10801bc/forestage-a-darwin-arm64"
    sha256 "7aed6bcad76b3c8da12865ec4f6651b1af39b42b8cf6061c671ce54456fc1f7e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260426-211943-10801bc/forestage-a-linux-arm64"
    sha256 "dea74e6bb7e9f48424741526f1172ed734222f7c61c15f7faf7cbf132347ef63"
  elsif OS.linux?
    url "https://github.com/arcavenae/forestage/releases/download/alpha-20260426-211943-10801bc/forestage-a-linux-amd64"
    sha256 "1e63298906b76740bed872329eb770eb7af310738dcdf855700342e6683c5c14"
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
