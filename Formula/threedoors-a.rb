class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.000807.cc02b7c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-000807-cc02b7c/threedoors-a-darwin-arm64"
    sha256 "e42c6ac1409171ddfa2848a373922c40c34e0861f1059f9e1b69cfb6138d677f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-000807-cc02b7c/threedoors-a-darwin-amd64"
    sha256 "a294f7ea71608cd943944c63a94dfc539dc06c93c6e801d6b0da2eb7b6ded764"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-000807-cc02b7c/threedoors-a-linux-amd64"
    sha256 "a9e3e4aef325142e7a90ca5bc920f31d60cff9681d5761552b7a7e6115c8d677"
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
