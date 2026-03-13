class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.222327.39e3e21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222327-39e3e21/threedoors-a-darwin-arm64"
    sha256 "72cb521e2a591d416ddc4f09228c0bdb2c7b53b18817f681420a02150424b35b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222327-39e3e21/threedoors-a-darwin-amd64"
    sha256 "5ec70675ca76b92df8a703fce6544e537acd5205c9d0902ba57fda7cb0979295"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222327-39e3e21/threedoors-a-linux-amd64"
    sha256 "38d6f4eadac65c63dc4349836b99696d93f6195887c41fbd7b120a5fbc58aed7"
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
