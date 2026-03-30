class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.235015.743b5b2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-235015-743b5b2/threedoors-a-darwin-arm64"
    sha256 "5f0d8253ff45af40107f4ab536fa2a0ec7676a5db53ac60394f898c9a75d473c"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-235015-743b5b2/threedoors-a-darwin-amd64"
    sha256 "da9e36bf88ce172221e9d4193b81a45f1096ec796f6d1eb47f2b2f871a5774d3"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-235015-743b5b2/threedoors-a-linux-amd64"
    sha256 "92e979abe6a69dabefdc35cd9eeaf66dffa3839feec6cd75427732f2cfe5e501"
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
