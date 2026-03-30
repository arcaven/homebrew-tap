class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.235726.600cf0e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-235726-600cf0e/threedoors-a-darwin-arm64"
    sha256 "c6fb0934835013b7af2c9ab1d243c156e3174a0bc6f6156e98df7bf8247a7a22"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-235726-600cf0e/threedoors-a-darwin-amd64"
    sha256 "187bfe63e6b5553c978a52b2d9b553818c2a1158c9a833df286a1c0c3b13b427"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-235726-600cf0e/threedoors-a-linux-amd64"
    sha256 "6e8ee3efe824ed4b6862aad29edf8fbfcb4b0b874384f37dbf4d914294eb1370"
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
