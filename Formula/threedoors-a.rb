class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.151121.d9b1489"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-151121-d9b1489/threedoors-a-darwin-arm64"
    sha256 "3b2a885d130a64754b44dbb3a36ad0cffac3fe47d05caee596e8b2d8a4f57052"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-151121-d9b1489/threedoors-a-darwin-amd64"
    sha256 "60ab4752d952aa899d15d5e3590054c8a5b35740cb7c3e0a4336d803c866d24d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-151121-d9b1489/threedoors-a-linux-amd64"
    sha256 "f3cf068fb7bf168cf468e7edeb5d6aef442f3df65c6346862cf27d115f137d9c"
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
