class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.215221.8c1a575"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-215221-8c1a575/threedoors-a-darwin-arm64"
    sha256 "7ab559de46f2ff81274139b8208435a57e909fffa520ff69d40c8dbbb28ff45b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-215221-8c1a575/threedoors-a-darwin-amd64"
    sha256 "e8a1dbc4648fc398d2f9280a4c795a6e84f1f265f1b050b9fae514e8c51897f2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-215221-8c1a575/threedoors-a-linux-amd64"
    sha256 "19522e69a6bb696799c7b2f42f0dc1cbfcc70b53fb1cb67d5b2af46ad5886249"
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
