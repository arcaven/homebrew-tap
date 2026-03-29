class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.221850.83f1ddf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-221850-83f1ddf/threedoors-a-darwin-arm64"
    sha256 "dd6d000b5dbb017b414117f3f7fcfdcb170cab95312f80d89a2927420a993137"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-221850-83f1ddf/threedoors-a-darwin-amd64"
    sha256 "c99aa40d2af0651e49b6325f6b259da499b32d8687079a7161e8bd218b042b58"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-221850-83f1ddf/threedoors-a-linux-amd64"
    sha256 "1e1c82da63f584c1306ca2c00760f476fec491c9526c3e69a60ede7297187056"
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
