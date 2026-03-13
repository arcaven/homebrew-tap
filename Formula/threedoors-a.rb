class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.175345.e315269"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-175345-e315269/threedoors-a-darwin-arm64"
    sha256 "4d077f2fd650c165395bfc779619aed3bafa14d9cf95d54c9a68403adc34f314"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-175345-e315269/threedoors-a-darwin-amd64"
    sha256 "2e4b66df56d4bd0edb5696548f7ab3ba7894d9956805812226125f325f2fd87b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-175345-e315269/threedoors-a-linux-amd64"
    sha256 "368c6377af6945888efaf8d04fb55aa6867dc714dfb9c670d05b04f746f5f7a1"
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
