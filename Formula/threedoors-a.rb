class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.065336.ea45ab3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-065336-ea45ab3/threedoors-a-darwin-arm64"
    sha256 "93af67e4d8c5feeb3139455c40551b619239bb56e6c3398c2d314954010d7473"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-065336-ea45ab3/threedoors-a-darwin-amd64"
    sha256 "0497ea433a3eb92de92c4dfaafc77a956113d9e70a7b5f8eab437a50714e84bd"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-065336-ea45ab3/threedoors-a-linux-amd64"
    sha256 "103c8d1107952d639bbcaf99f87f9637a6d37e94b70a9ca328f3b1a6b5edccb4"
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
