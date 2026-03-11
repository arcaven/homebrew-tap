class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.e1bfbf4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e1bfbf4/threedoors-a-darwin-arm64"
    sha256 "0c23c518d4dad2d492e2cafaaae65e43ecdafd2debc98f10204748297f97551e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e1bfbf4/threedoors-a-darwin-amd64"
    sha256 "9a8cad612d9aec62414ed502f7e53e42b80622b1472351c76697c9ebb26e5a4e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e1bfbf4/threedoors-a-linux-amd64"
    sha256 "2c4c7bb5361a9eb52c9284a3264006a1fb0f3f69bf858d9114f18c8ae45f9b43"
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
