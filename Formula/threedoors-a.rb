class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.57dff69"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-57dff69/threedoors-a-darwin-arm64"
    sha256 "84971de8b7eb9c6982af382e2c9d29016c314540bdb69dca264d5fdb91e4ae21"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-57dff69/threedoors-a-darwin-amd64"
    sha256 "83bc8c4f802eebf269cea6d9b2a1c31aa5cf98b79ac49b37ba569cf4bfa837b4"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-57dff69/threedoors-a-linux-amd64"
    sha256 "e28bd2b68b732a914d0dc302fd73dd92fdf19074bd82057056bec05b97c2773a"
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
