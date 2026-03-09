class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.d8054f1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d8054f1/threedoors-a-darwin-arm64"
    sha256 "a3f126e2eea9d6c7f5f9e02ee24df37ff0b475627cd5684fa95066cf77102bcd"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d8054f1/threedoors-a-darwin-amd64"
    sha256 "e4eb64d1f9ac174a784d22145d9db4902b3b340343c0891e82c851793ba4f1ea"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d8054f1/threedoors-a-linux-amd64"
    sha256 "1de4392ae0dc45d9686c2c0c282412e7a65483a9144f16850dd876a7b2103a44"
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
