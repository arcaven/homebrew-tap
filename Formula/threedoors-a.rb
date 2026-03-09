class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.8e83ad4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8e83ad4/threedoors-a-darwin-arm64"
    sha256 "bf02a116daef71680f043debba853fe26e7360ab7b58ae017cd8bf54dacae91c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8e83ad4/threedoors-a-darwin-amd64"
    sha256 "ac2342036d177ec44a5fba407a4dcb3ef66a803c49594e6ff65375621950640c"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8e83ad4/threedoors-a-linux-amd64"
    sha256 "8a9542aa1e19796756b47f3b603b1125a2d4980ef62620d341becb65b3969127"
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
