class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.233620.c6216ce"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-233620-c6216ce/threedoors-a-darwin-arm64"
    sha256 "cd198cb2c116bb9c8a031146103cf21ef3d0b98920f90f3e1d3fe7a285826321"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-233620-c6216ce/threedoors-a-darwin-amd64"
    sha256 "2d915e741715ff5b854c2c4f9247a17d2c3e93e027c0a37e1f15b9ce435cdd8f"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-233620-c6216ce/threedoors-a-linux-amd64"
    sha256 "7a4294b308100e00217c8802062f181a131aaf104a133da8f527ecb04e517369"
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
