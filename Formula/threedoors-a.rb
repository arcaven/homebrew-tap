class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.235507.98d04a2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-235507-98d04a2/threedoors-a-darwin-arm64"
    sha256 "1801a6be0ac4c714b4c58fdb2edde8d44e74a8e181fe85dac7614b5b49b46191"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-235507-98d04a2/threedoors-a-darwin-amd64"
    sha256 "5986401837f158ca3a799085f1ca9cf6dcd64721233be0ef51a129f226541113"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-235507-98d04a2/threedoors-a-linux-amd64"
    sha256 "05754907531e31637b2cba1fef980099f71558d6b904a429dc4c5b69ae96bf94"
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
