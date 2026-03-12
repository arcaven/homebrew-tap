class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.010612.9dcdccc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-010612-9dcdccc/threedoors-a-darwin-arm64"
    sha256 "d391de7ead604d55823fd813e0ff7fadc3b852ae499c9c6d2640989003cd855f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-010612-9dcdccc/threedoors-a-darwin-amd64"
    sha256 "a8a5cd892f56c1812dfa0a7f0e5527f4f2bf4061cb20c62a56b7fef13746370c"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-010612-9dcdccc/threedoors-a-linux-amd64"
    sha256 "cbc6abca3b81b5701f2850f1528a5d307f080d6add1b8342a59352eece5af1cd"
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
