class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.004533.35288ac"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-004533-35288ac/threedoors-a-darwin-arm64"
    sha256 "98b70fac981dcddba8d1427da1f287774e2f17e1d45b3772def5184e4453bf12"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-004533-35288ac/threedoors-a-darwin-amd64"
    sha256 "ca6ca059803d97b07b4769ac0513a0b2f17948ceb14ca2f27843d69bd5dc9175"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-004533-35288ac/threedoors-a-linux-amd64"
    sha256 "72a9f74b33e7dd69b229b3226bd684840f09cda022c4974aaff172b65c3e25a0"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
