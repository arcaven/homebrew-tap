class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.c6e92f5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-c6e92f5/threedoors-a-darwin-arm64"
    sha256 "f7229ccd8da8313ad4fc0ee1691179b10ce0b2a6f8de06991124fb5935dc508c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-c6e92f5/threedoors-a-darwin-amd64"
    sha256 "f126871fb7ab565c03db626a355c255e490c6f230a3595b2411316a04ff4ad19"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-c6e92f5/threedoors-a-linux-amd64"
    sha256 "8de7d1dcaf88fb6f5d4a5809f31b7a31aba0a69e13b37ba3611daf6bd66abb5d"
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
