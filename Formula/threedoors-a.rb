class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.062249.e01d9a0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-062249-e01d9a0/threedoors-a-darwin-arm64"
    sha256 "a9fb0b3a188e172d900ad5d7c4fbef1ea72d40367c2ad1d50aef3f81a69fafb8"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-062249-e01d9a0/threedoors-a-darwin-amd64"
    sha256 "2c621de0b15d4a54112015c79bdeb637943c59a93cbb6af8b494bb33df24f93b"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-062249-e01d9a0/threedoors-a-linux-amd64"
    sha256 "e04f44e1b81b970cc4919cb884d70fb5c3d5075f5990b8e61ebeb6e7e6e59dfb"
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
