class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.a328428"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a328428/threedoors-a-darwin-arm64"
    sha256 "8e7fc015ecbd81fd744a70ec2065cfdebab9e6f703141a1326f89d3cdca2ff27"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a328428/threedoors-a-darwin-amd64"
    sha256 "83e17faff2d1710d7dea6d3b214ddddbf156ddeabda08ac6912c0b55fa88d275"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a328428/threedoors-a-linux-amd64"
    sha256 "7cebd58aff44bb38738745b3f7975b0a84bee9870989e7d7b14bf04ea355c4b0"
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
