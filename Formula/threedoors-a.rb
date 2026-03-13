class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.001523.845b482"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-001523-845b482/threedoors-a-darwin-arm64"
    sha256 "7751f6c42793c9f51cf694405cde85734c2f1b2dd46e62e6f7571442a3e7acf9"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-001523-845b482/threedoors-a-darwin-amd64"
    sha256 "2804ed9c75ab428d4c574bc28158c991f3576601a9e2346f9307f865f4399d41"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-001523-845b482/threedoors-a-linux-amd64"
    sha256 "d72863b08b333673fe34409e4340ddb45f4b4f0fdada9fda97c16a213471b9ee"
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
