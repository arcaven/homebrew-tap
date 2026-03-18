class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260318.062015.7d1d97b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-062015-7d1d97b/threedoors-a-darwin-arm64"
    sha256 "b8d6092e9f4fd37e1e2f570340d31ecf723e812bf221b01a8ec51589343f3e88"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-062015-7d1d97b/threedoors-a-darwin-amd64"
    sha256 "3743b3e678c0e9f560530ed18b595d18532ee0806938dc5921e6dd0bb538458d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-062015-7d1d97b/threedoors-a-linux-amd64"
    sha256 "3fec4714ba5807d86ce39dd55e26dc379e1c835cb41bd5ee157405d4ef2e6d15"
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
