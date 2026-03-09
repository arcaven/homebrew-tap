class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.f5f4a9c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-f5f4a9c/threedoors-a-darwin-arm64"
    sha256 "e8e9abc90a9667ea1a73396d2dc62ec5123a510a274d51c40cefc50398e6623a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-f5f4a9c/threedoors-a-darwin-amd64"
    sha256 "1125ca8ee540a75c8cb9c5589dc2588b4f028b66288c03bfeb0d53c43fa8695e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-f5f4a9c/threedoors-a-linux-amd64"
    sha256 "db07920e1b2918b1d24e23665ae9b70a3c195e90af9c8f617ae2556c2c77eb8f"
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
