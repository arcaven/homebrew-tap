class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.022202.ec9bd4c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022202-ec9bd4c/threedoors-a-darwin-arm64"
    sha256 "b6b25aa5c855e6588e398ce898105e091eaad6c9d3f771facb0e0c3caeb3ba63"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022202-ec9bd4c/threedoors-a-darwin-amd64"
    sha256 "dddd26d92f8b20309dae6655484404a1a2a87c0641e80635e6359c5d2f7b9de5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022202-ec9bd4c/threedoors-a-linux-amd64"
    sha256 "227b9b70564659841f15d62277ce5a04decc7437d834196f9320f7aa32bbc3d4"
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
