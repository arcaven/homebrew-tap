class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.b8ff6bd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b8ff6bd/threedoors-a-darwin-arm64"
    sha256 "87e426659632bb1e52846a00f650c8412ca87912ac7cf05c8467eae54634bb40"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b8ff6bd/threedoors-a-darwin-amd64"
    sha256 "cc6ae13a4e8d8cf5c0eab8a663f1e2ad8ee35c674486e465703d48e60f4a916d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b8ff6bd/threedoors-a-linux-amd64"
    sha256 "3bdb5c6a49c8127441a90054cc0f14d68a4e77147f9bda3d9ae4e89f01a004d1"
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
