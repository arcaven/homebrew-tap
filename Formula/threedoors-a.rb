class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.6f43ec5"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6f43ec5/threedoors-a-darwin-arm64"
    sha256 "6d0219eb89a68dcdb10ef08e7e0bbb27b45c7e60d2881013eadc4c18712c0014"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6f43ec5/threedoors-a-darwin-amd64"
    sha256 "5664be5ec772f9b7f23206b66885e4a273dc4560b67073eac2f2d3ba779410a1"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6f43ec5/threedoors-a-linux-amd64"
    sha256 "af16ab6a5814269a35dbd91e0fadc373085bb05a19395f2e2350b87d9b16ffc3"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
