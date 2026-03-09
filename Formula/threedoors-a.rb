class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.0cc1c1c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0cc1c1c/threedoors-a-darwin-arm64"
    sha256 "2933e4604c7d1a6b9d283b1e88f6b73a0c2ff66cc75e38713997af6e7716e326"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0cc1c1c/threedoors-a-darwin-amd64"
    sha256 "a35784c44e66f773c80717982847286c1a10f741e8dbc97c12b4ece0517b05f2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0cc1c1c/threedoors-a-linux-amd64"
    sha256 "4ee6f9cac138c8c6b7b70ddbab3dbee91be4fcd21fe6007a26a98f2c0e1c05b1"
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
