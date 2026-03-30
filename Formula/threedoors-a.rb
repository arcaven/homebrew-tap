class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.015345.fc62bdd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-015345-fc62bdd/threedoors-a-darwin-arm64"
    sha256 "29b92a077ce6d8c28e576fc60e188f53d457096fc1bb28c74219c61b033196ca"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-015345-fc62bdd/threedoors-a-darwin-amd64"
    sha256 "17ac11a67e420e9893977dd11ca08e4432e464fffbda1c60b16fbe9c400548f6"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-015345-fc62bdd/threedoors-a-linux-amd64"
    sha256 "b979f899dad1499ac4d020c50a2228560e59ee00a100dd651b2528286ef5ad35"
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
