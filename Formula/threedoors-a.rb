class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.173417.05742e3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-173417-05742e3/threedoors-a-darwin-arm64"
    sha256 "dff8b0f6c96445255a7e77b8340231219d3e6f56d3d18478b7e1e4227b4dd55d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-173417-05742e3/threedoors-a-darwin-amd64"
    sha256 "2cc192f223964dce08a1564bb60fb091a7f5b15ce6187b78a6f448943248a7a4"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-173417-05742e3/threedoors-a-linux-amd64"
    sha256 "aff7cf556e47916bcba2b01d61aa189149013205352af4c8f194336ac926313b"
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
