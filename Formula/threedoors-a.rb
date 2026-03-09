class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.8b24a99"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8b24a99/threedoors-a-darwin-arm64"
    sha256 "3fe1b8d96bd997da1ce02169ac86f053a881e3148aa4a121e21c9909ca068992"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8b24a99/threedoors-a-darwin-amd64"
    sha256 "4a62208709df3d09e3f7e0ced0d6522e63044172d8b16eb1b163e7d55e685960"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8b24a99/threedoors-a-linux-amd64"
    sha256 "fa175c958321768770ec90a8b725c4e28c9374beeac573ab60cfd7d91caade22"
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
