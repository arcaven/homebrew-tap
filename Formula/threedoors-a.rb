class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.065219.c8bedec"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-065219-c8bedec/threedoors-a-darwin-arm64"
    sha256 "6180773eb5da14ce716093d05aa31c605bed36191cd215211fc50db2bd70e9d3"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-065219-c8bedec/threedoors-a-darwin-amd64"
    sha256 "5fdf0e9cc0ba7f2a449a46845c4bd18f382b9d091374d90bdb8dc8116ed51cd2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-065219-c8bedec/threedoors-a-linux-amd64"
    sha256 "42ba92349b24930728558838c7d6d0147c9aaebeb83bd7ba0fc0392c5fc8e99c"
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
