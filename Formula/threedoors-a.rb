class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.6616f66"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6616f66/threedoors-a-darwin-arm64"
    sha256 "0b1bfa44f61c395e7229729fb7658d3df0d4dcbce861a3daf05926cc7a377201"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6616f66/threedoors-a-darwin-amd64"
    sha256 "92fa3576f2c0a1f1a8a1f6236582c1bfbd34128a2dfecdfd0729a4ec0ff45802"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6616f66/threedoors-a-linux-amd64"
    sha256 "aaa3214679c9f630f1eb854fc242f89bd2fa784d332793f47e9879e2e59dd1ba"
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
