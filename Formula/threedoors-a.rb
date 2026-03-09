class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.710d927"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-710d927/threedoors-a-darwin-arm64"
    sha256 "19b8d8fe9c8db83817cdaf94ad5e8bd9e75849bd43ff7f287a6463167c1a59b1"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-710d927/threedoors-a-darwin-amd64"
    sha256 "7220832862a998e490839da46e09a8c13c77bec1186899d94ac7c6001b240e89"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-710d927/threedoors-a-linux-amd64"
    sha256 "834ce6a3f704124ff23b745749efd74502ac9b18b8b8b86c6dead13363d8b8d3"
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
