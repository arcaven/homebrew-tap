class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.234012.9a389bd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-234012-9a389bd/threedoors-a-darwin-arm64"
    sha256 "92907b695d832905d71e3794cad42d5cf6f0d33b8beda9ac75bebdd5387aa3d3"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-234012-9a389bd/threedoors-a-darwin-amd64"
    sha256 "5e086ba83ddf14b8251851630a1626db88a548bf6d6c010c1b985a79fcbc8902"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-234012-9a389bd/threedoors-a-linux-amd64"
    sha256 "6a3ca1e00357680ecbe0a64c6544d186ebd890d3027e7f74c8e24e23236353a5"
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
