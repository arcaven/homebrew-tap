class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.b28362b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b28362b/threedoors-a-darwin-arm64"
    sha256 "15ad2bfba364c90bc593a3277d7bf30f339f092105ba34974b784de8024decc3"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b28362b/threedoors-a-darwin-amd64"
    sha256 "237078b8833b1c9158843483f724c4933f8369a4160c008b1df8cd05bdc16358"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b28362b/threedoors-a-linux-amd64"
    sha256 "ec8e440e0967c92d6f4d4ed38779cfec1f163763f6ef8fc7c556db42c34ae918"
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
