class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.797278d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-797278d/threedoors-a-darwin-arm64"
    sha256 "13add7539afe3d67a45257c1325ca0053f8d808ec7d122b1dd4507b0bdfed13a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-797278d/threedoors-a-darwin-amd64"
    sha256 "3bf28b6e7cd9ca7fb0ad853d3c4918f123b615ee2eb4c458be790bba76dfd1ff"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-797278d/threedoors-a-linux-amd64"
    sha256 "f753f7aa69a00a5d2d8d9f8cc3f2fb7532181cbe7fe1aa2d29eaa32056cbb55a"
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
