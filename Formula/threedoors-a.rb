class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.8f8b208"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-8f8b208/threedoors-a-darwin-arm64"
    sha256 "99a71aa9c6674e65a88f0b4fcb5f9c7283d1db7cb29cbffeb4dd57ca6d5b8f78"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-8f8b208/threedoors-a-darwin-amd64"
    sha256 "a42cf973c7dcfbed968ff55f4de725c3538abbc86590c29bbb5e21d5ae40fea5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-8f8b208/threedoors-a-linux-amd64"
    sha256 "5a2206e2f19fb8253c29b85cd85af400bdef93e8a714c9ce66f23bfb24df1158"
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
