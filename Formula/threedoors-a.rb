class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.3d0e51f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3d0e51f/threedoors-a-darwin-arm64"
    sha256 "f910f5d1681d438d076c03e001f5a070ff80f0cc6e64c5ea2be08efb1bcd6774"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3d0e51f/threedoors-a-darwin-amd64"
    sha256 "b9eadbbec498668647c35a5e789eb9d27cd685e9a13b8c5b3eac7864c7eebe99"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3d0e51f/threedoors-a-linux-amd64"
    sha256 "8da3b73228adf18410d78239394f42fcf8996b1de1bcaf56095b9a9a971034ba"
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
