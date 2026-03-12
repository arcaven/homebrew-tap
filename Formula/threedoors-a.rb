class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.184325.f6fd880"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-184325-f6fd880/threedoors-a-darwin-arm64"
    sha256 "83e9e7da1dcf87fa0b70ee98fc815467c4fa508d2b14a9288d28e0b84a9e7e29"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-184325-f6fd880/threedoors-a-darwin-amd64"
    sha256 "bd11dd3c910ef9c5f619a8f47b5aa0c9cd7a4007bcfaa7da2e1254e751f87995"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-184325-f6fd880/threedoors-a-linux-amd64"
    sha256 "4068892b4e220bccdeb6ec338e31ac51b20f22c92c8fd8c37b13cc4a63378a41"
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
