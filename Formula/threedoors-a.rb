class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.c89dbd1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-c89dbd1/threedoors-a-darwin-arm64"
    sha256 "48f45666b8711342397aaad804089177f0354d16bf39cdec6e5becd28f652436"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-c89dbd1/threedoors-a-darwin-amd64"
    sha256 "cc092edfec93a090df20db35548500a2d54d71b57684a4e82051c12de8d6f514"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-c89dbd1/threedoors-a-linux-amd64"
    sha256 "5c72631c1d4ce4ef2c689162ae141707aace90e970b285b9c77a19d26c9f6354"
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
