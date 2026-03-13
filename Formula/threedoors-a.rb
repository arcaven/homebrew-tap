class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.195033.03e7157"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-195033-03e7157/threedoors-a-darwin-arm64"
    sha256 "7682438707635b0e1c70c1831e8217dbd51859862bd86c2c85cc03907081195a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-195033-03e7157/threedoors-a-darwin-amd64"
    sha256 "012abca3575c4122b68227c210336df3ec4916a9ccb2ae8477e2bd5e17e6d765"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-195033-03e7157/threedoors-a-linux-amd64"
    sha256 "ef0da0786b6fc12218217cbb02e56b531757384fea9660a7d857e6d151a7f326"
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
