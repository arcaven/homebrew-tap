class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.192216.ebf6810"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-192216-ebf6810/threedoors-a-darwin-arm64"
    sha256 "88e6baa9a7740d9b6c00550ad7c37ca1d13e1f8c3658afb6c65328cce73037e8"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-192216-ebf6810/threedoors-a-darwin-amd64"
    sha256 "990b2ee678dce21bfcaeb45ae5ba04d5bb9a58d672f664e7486a775b87f4eb76"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-192216-ebf6810/threedoors-a-linux-amd64"
    sha256 "1a56fe6851ecbeb6d9386bd585e907042c1de116a44f003ed4f735c04ec263aa"
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
