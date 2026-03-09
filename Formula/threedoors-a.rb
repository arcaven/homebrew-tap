class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.22fb08f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-22fb08f/threedoors-a-darwin-arm64"
    sha256 "951c2c51ea429a800851a489de24cdba051242fe0f3d8a4dba052d5695e1552b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-22fb08f/threedoors-a-darwin-amd64"
    sha256 "1c653e048d64f1da98642abf613940bc26345c2553daa2d7ee76a1f6e5f5e499"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-22fb08f/threedoors-a-linux-amd64"
    sha256 "bbb1e8cdb51c3d24ebb9730bbce435e3cd37659d3c0edf4378db21c35852f6a7"
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
