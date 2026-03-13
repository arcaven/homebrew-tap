class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.064542.1e13ecd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064542-1e13ecd/threedoors-a-darwin-arm64"
    sha256 "68cc9a3ba1113841398b8d789df82fd99216a4a23c0028d8f9d289059cfbd2a9"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064542-1e13ecd/threedoors-a-darwin-amd64"
    sha256 "953194fa65176a95e06ba9fb3f38e4a10a56d4f5420de1a9c1e306d2b376d955"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064542-1e13ecd/threedoors-a-linux-amd64"
    sha256 "2a14d7f1b4a4bc65b8bfc9bdb871e1fa66672540891f9d3f55d183df111bdf6b"
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
