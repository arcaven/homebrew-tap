class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.010013.a2916de"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-010013-a2916de/threedoors-a-darwin-arm64"
    sha256 "645620725ebe9f39a8275b735db7b6a90a779259902086a6809006cfc6fb4f79"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-010013-a2916de/threedoors-a-darwin-amd64"
    sha256 "0243a6fc94b6be9c33124794f9fe2088408fb07f4dbb6585e35c0c34b47952cd"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-010013-a2916de/threedoors-a-linux-amd64"
    sha256 "d859554cd1f4f7548561c27c252cf5a6d56290fc832003469369ca31b68483e2"
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
