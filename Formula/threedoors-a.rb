class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.25e9ab9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-25e9ab9/threedoors-a-darwin-arm64"
    sha256 "27bb8e0da4f9797d0b2d75119ef1816f9ee17905a31b061f03920e96b6454997"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-25e9ab9/threedoors-a-darwin-amd64"
    sha256 "76ae457800729e1951ca80b26d4103da56ea95cd2bce64341b5a4adde002ce25"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-25e9ab9/threedoors-a-linux-amd64"
    sha256 "7f1b9ff5a45a4327d891f725d8bffbb67d33ba5d3b4c9553ef62f2809611b2c2"
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
