class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.fcc6d0c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-fcc6d0c/threedoors-a-darwin-arm64"
    sha256 "3590d894b266a504c7f62d5d110c3e7d157ef3437ea959d3d2d76dcb2ac756fc"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-fcc6d0c/threedoors-a-darwin-amd64"
    sha256 "e619eadc6ec262cece929ff328092555fa3e5a13e091e0201d27d5e124d005bb"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-fcc6d0c/threedoors-a-linux-amd64"
    sha256 "d34bdcd17ebb32e27f259fa670eee1b6d3b70e6a995b0a3492a9eea4991e451f"
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
