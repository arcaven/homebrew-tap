class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.212204.1a65fa7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-212204-1a65fa7/threedoors-a-darwin-arm64"
    sha256 "0a113a1ea8dd2eb83622316f8d4e12b97ef562a5010884c24099aa34974b6926"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-212204-1a65fa7/threedoors-a-darwin-amd64"
    sha256 "e66d0752715a58d220359d8bd585aac3f4bfdfade110faf86268f1a94877f04a"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-212204-1a65fa7/threedoors-a-linux-amd64"
    sha256 "ba375a6f5aa97d5137cd01539cd53b1b01574d0c79a15b3f2b19d859b9e6f932"
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
