class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.014904.1685537"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-014904-1685537/threedoors-a-darwin-arm64"
    sha256 "96ac2a2004e6c2b8ad6b57171d7e392f70f90054ec25df7d6469a76cc0e2b3d2"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-014904-1685537/threedoors-a-darwin-amd64"
    sha256 "a2d2db4b85aba750333feb642ec5d192418bafafe2c0fd7206f8075fdfe6ca55"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-014904-1685537/threedoors-a-linux-amd64"
    sha256 "d31694ce35d1355d12956dd27d5d259f64d9bb69a75ef0bb08e4be1bdf7b599b"
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
