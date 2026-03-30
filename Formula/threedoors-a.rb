class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.034835.7b63365"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034835-7b63365/threedoors-a-darwin-arm64"
    sha256 "7a38678c83d9b6457d9944c957b7d873da2fc431888b744536977090479373fc"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034835-7b63365/threedoors-a-darwin-amd64"
    sha256 "b9f4f1e4664a269f84264f03aaa8c5cf2d60e346ea24ca7bb6f2fa1c0a74ead2"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034835-7b63365/threedoors-a-linux-amd64"
    sha256 "2dcdf9ad0c8e1127021547f8bc0a37436a6f022ef1046e7f4d5a22de9eac99db"
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
