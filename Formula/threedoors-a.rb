class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.174713.b53f12d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-174713-b53f12d/threedoors-a-darwin-arm64"
    sha256 "86e1ac1c6a49674c73122a19fee78b4f4f0c8706a3a3f17af6da20df745f07fe"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-174713-b53f12d/threedoors-a-darwin-amd64"
    sha256 "308eeb58bcc03d2c824983dd88aba3d6827ee731a0857f07b172a0bceddb72bf"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-174713-b53f12d/threedoors-a-linux-amd64"
    sha256 "827df154fcc9373139e4f87139bf72566f1b9a824ff7f3a3f66ee71dd561e662"
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
