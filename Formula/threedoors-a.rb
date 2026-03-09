class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.46ab88b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-46ab88b/threedoors-a-darwin-arm64"
    sha256 "75cf90a36d87173af69d5b04554eb18488fdec8398273027bef257c4ab5cb03d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-46ab88b/threedoors-a-darwin-amd64"
    sha256 "bf00984e1c58a514b5f258602455f99a99fa4f2b85548b94fdec6b7de2e4aa68"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-46ab88b/threedoors-a-linux-amd64"
    sha256 "f7d89b7775fa8002ff2c43599947bc258b3eb8f10191df3e79f18ec72e4359ef"
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
