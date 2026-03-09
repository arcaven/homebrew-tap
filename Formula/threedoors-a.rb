class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.86bf1a0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-86bf1a0/threedoors-a-darwin-arm64"
    sha256 "4b04c9dd6c946f7b07e661cd5ddda69ba292494baa77292fd948f44b780dbbb8"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-86bf1a0/threedoors-a-darwin-amd64"
    sha256 "341ca165406bb712c5b36870f4bdda9966454a84cbe949b30631fed52a0cd4a6"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-86bf1a0/threedoors-a-linux-amd64"
    sha256 "07f18dfb57a56d12b9fdf7bff4aa41978438e9503fb2e9c8cc495df226524d41"
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
