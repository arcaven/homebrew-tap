class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.225907.ace7a9f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-225907-ace7a9f/threedoors-a-darwin-arm64"
    sha256 "0a1700b81361cb6682ea7223675ba54a1169e71e986241e8940c3e793a5f9353"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-225907-ace7a9f/threedoors-a-darwin-amd64"
    sha256 "55b30d44d41a6893a18f6c01b34bb5736cfc8e879fa3d9f5dff20210a1c6b147"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-225907-ace7a9f/threedoors-a-linux-amd64"
    sha256 "8d242ea591d925d9a48ab66e89bcb91ef75521ad981cbaa144b0d303b6af599b"
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
