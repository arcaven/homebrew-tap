class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.182614.b2d064e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-182614-b2d064e/threedoors-a-darwin-arm64"
    sha256 "684e03030e1678bb2862e6a95cf8c7bd21d3ea3708f24db424a37d5b64113c5c"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-182614-b2d064e/threedoors-a-darwin-amd64"
    sha256 "9883294f21e2d02b7e5f7d8dad44e35a161f01cc55cc43cff154a8b09cb15e62"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-182614-b2d064e/threedoors-a-linux-amd64"
    sha256 "73781f55cf267f20282d723b77b432bc7c201c3c4e949323f12d5753f1af5186"
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
