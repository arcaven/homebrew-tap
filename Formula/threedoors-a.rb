class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260319.024703.17f3d2d"
  license "MIT"

  if OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-024703-17f3d2d/threedoors-a-darwin-arm64"
    sha256 "cc3170568c58d3198f8a71dc694b9918b62a0bba474e9614cfa8cbc9c0e88236"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-024703-17f3d2d/threedoors-a-linux-amd64"
    sha256 "d49cbce7f4a58d788ad4f6893133cab7978067bca891cbe0a7def5a2c0700a39"
  end

  def install
    if OS.mac?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
