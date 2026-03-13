class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.052649.76e0c98"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-052649-76e0c98/threedoors-a-darwin-arm64"
    sha256 "33cab91fdd4740e53055bcd22e9b7a93d9806213b6eee439c5c812bd14d55d92"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-052649-76e0c98/threedoors-a-darwin-amd64"
    sha256 "8c68833d8d41829310de6e29329b4300ddcb99097ae546e6fecaabe5c506c39a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-052649-76e0c98/threedoors-a-linux-amd64"
    sha256 "2dfcf498258dae520aa16a3950a6040fe13fcdc1fa9942eb6eccddc173e080d3"
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
