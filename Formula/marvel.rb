class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260514.004445.a6fe869"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260514-004445-a6fe869/marvel-darwin-arm64"
    sha256 "3052ddc3eb4a5f12eddc41f0abea1ecd0cd8f935707ec0ddb5ec8e8ea515c7bf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260514-004445-a6fe869/marvel-darwin-amd64"
    sha256 "b57b9fa532c0d73fd7c3032dacf220b66ac9368f955a7f12ae641e448e3c8228"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260514-004445-a6fe869/marvel-linux-arm64"
    sha256 "fdb00ce6beb3a017ee8ffc44fe3ff593817597607fd545cda2bc994cc9cf1a4f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260514-004445-a6fe869/marvel-linux-amd64"
    sha256 "e9bbcebff8bd7d57836c089f632ba852d8d2711ea563cd49faf7b81822c20b33"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
