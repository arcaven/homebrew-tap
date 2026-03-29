class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.171906.e7b3b80"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171906-e7b3b80/threedoors-a-darwin-arm64"
    sha256 "866b48cb03520645bf24264b8f26573e11331166e40206f11074658adc65ad6c"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171906-e7b3b80/threedoors-a-darwin-amd64"
    sha256 "34fdc2c8a0989c030254db26a2c6417cf109bb59b9bb646673e90074a3a6fa4e"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171906-e7b3b80/threedoors-a-linux-amd64"
    sha256 "e63aca86cdb208277d7235df9e27ed515f46fb3818731bed8c8d705a56ecd162"
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
