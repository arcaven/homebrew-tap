class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.200027.ecd1a1a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-200027-ecd1a1a/threedoors-a-darwin-arm64"
    sha256 "b12664d16824a89f2d7c15047e609da1628b3db57aa06b1d099e13d2337899bb"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-200027-ecd1a1a/threedoors-a-darwin-amd64"
    sha256 "1cfc0317b22801ec16b8c1cafc4f857bc465fb620cde1e099857d8f2cd776dae"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-200027-ecd1a1a/threedoors-a-linux-amd64"
    sha256 "89d52cdcde7e12e2224524ef011eac94569de8cd8f95cda40d6f1479b953452e"
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
