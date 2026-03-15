class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.163210.255ff9f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-163210-255ff9f/threedoors-a-darwin-arm64"
    sha256 "e13179a83d868b74e56b140b8eb1fee7d7e5b80e841450fbeaecf7ac82dac557"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-163210-255ff9f/threedoors-a-darwin-amd64"
    sha256 "95edff8a74c0d17109bb272ae31a0c9cc720112e0e0d7bf7a7d311c6318d0eeb"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-163210-255ff9f/threedoors-a-linux-amd64"
    sha256 "857af1ea16523b5ec175df8712f89f45e471f33bcb4399815f2518265358753a"
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
