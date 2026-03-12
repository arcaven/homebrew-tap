class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.225648.6b15709"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-225648-6b15709/threedoors-a-darwin-arm64"
    sha256 "bd52435fd8d69ffe9685d867b8032987c14b9cd17b26154b44a678d6ffec4fd1"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-225648-6b15709/threedoors-a-darwin-amd64"
    sha256 "0b53603aca63ba8d872c2df109d7776e916813217a2e2e6856cd9f2c1424fbb1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-225648-6b15709/threedoors-a-linux-amd64"
    sha256 "c80449cb754e93ebe9c31c8bda7a9af5de6c3a0894c8055e8221642f5c53e55c"
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
