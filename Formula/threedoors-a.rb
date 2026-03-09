class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.e1471de"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e1471de/threedoors-a-darwin-arm64"
    sha256 "0e1f883128dd99ffa4cd4065c61e05d40e7e138f92e741e85715e9711d57abe8"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e1471de/threedoors-a-darwin-amd64"
    sha256 "87938a33dc90fd37b985d698cc8123958c23ac092c646b2cfdb18cd1da3499fe"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e1471de/threedoors-a-linux-amd64"
    sha256 "84b55948b22435eb7ebcc2d45630114fef8a4a1434972673e299f3a4f1306554"
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
