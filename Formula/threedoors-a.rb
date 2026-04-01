class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260401.021605.d55a4a3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-021605-d55a4a3/threedoors-a-darwin-arm64"
    sha256 "687a6395d916e94c8817b6817b15b2d37dd597cd87e86db9928b3ecc9a5c8bf9"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-021605-d55a4a3/threedoors-a-darwin-amd64"
    sha256 "d57539628a3290cae75049bfabed5b942ff67020f7ffc3c593f5a7aabdd1e24c"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-021605-d55a4a3/threedoors-a-linux-amd64"
    sha256 "344e4b56ee9acf12e14d765e3180197e3ee5a1b89474ab67abc4408b82b3a47f"
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
