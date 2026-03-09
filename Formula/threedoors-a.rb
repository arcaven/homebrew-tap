class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.a712d5a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-a712d5a/threedoors-a-darwin-arm64"
    sha256 "b2bcb79ec602e5b2136f9b43108db100ffcbe2bfb0ea115fa0a1eb9d278ca0ec"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-a712d5a/threedoors-a-darwin-amd64"
    sha256 "8179879d31e80c010d47bd3ea0215b172de17a1053f47eda351542f9220cbce9"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-a712d5a/threedoors-a-linux-amd64"
    sha256 "8dd304bb6983afbb62b11b739f58474c1d13e0e81d85a4e6cc144b9dd695d651"
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
