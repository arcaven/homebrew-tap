class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.56e35f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-56e35f7/threedoors-a-darwin-arm64"
    sha256 "ffe695fe6227969b7e004d7d977163dd482c9d3ececf419fd5ab46e83ced8f7e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-56e35f7/threedoors-a-darwin-amd64"
    sha256 "3a398f17f9997b0d1c0ec08f8035fb359b881d0a0350bdc61b3c30b89c0debbb"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-56e35f7/threedoors-a-linux-amd64"
    sha256 "b7e60cb70dedc9aa3410bd2240ea93f1b76583b85b9a69217eb1f966668b62a8"
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
