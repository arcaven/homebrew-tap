class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.5fb47dd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5fb47dd/threedoors-a-darwin-arm64"
    sha256 "48efcddfee36efbf4e90566ec927f1d1ae8cb706b5692bce7cc1434729a4a9fa"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5fb47dd/threedoors-a-darwin-amd64"
    sha256 "3715ec284ad297ff91e4452014ccacc85fa037192fd6d328a398b806b38e02f8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5fb47dd/threedoors-a-linux-amd64"
    sha256 "4ae5fbdbc832727c16b1a4c047c7e6fd4fa9199af7d1e1127a6e04d72d07dbce"
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
