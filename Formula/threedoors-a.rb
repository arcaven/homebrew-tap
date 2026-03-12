class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.022623.3376dcb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022623-3376dcb/threedoors-a-darwin-arm64"
    sha256 "5b6cbd6085a666d22be9f4264cf899aa3e6ed36296a1fb274b2b21a39ed68f9d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022623-3376dcb/threedoors-a-darwin-amd64"
    sha256 "2d9cc1b8db39dc968ab2d3962f206865bd025d9619e58692e6b823a8028c2601"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022623-3376dcb/threedoors-a-linux-amd64"
    sha256 "5cffb169668e8b25e2b0b17863561da218db8278f88e78207fe579094033042c"
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
