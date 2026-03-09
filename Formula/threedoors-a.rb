class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.27be543"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-27be543/threedoors-a-darwin-arm64"
    sha256 "450fbc253fb0fce0d8913271eaa87ef8b63d100cdf476dfcdbdd3fc1d1f5a59b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-27be543/threedoors-a-darwin-amd64"
    sha256 "2d62f0ac62895edb47019f1341690b0591a3083ea4b69b2e5b74b73d22d3767b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-27be543/threedoors-a-linux-amd64"
    sha256 "36888a2f41a38db126ce73f2028b921a3a4686279131da1a721b23602e4bbcd2"
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
