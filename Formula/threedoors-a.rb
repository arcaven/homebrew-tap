class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.063310.c825fa5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-063310-c825fa5/threedoors-a-darwin-arm64"
    sha256 "3fa63c74b30a19911e1da38df5b93149a19094daff636201b0b50772c06c8445"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-063310-c825fa5/threedoors-a-darwin-amd64"
    sha256 "6e52907d946a1ca8fc4f476ed81aaeb4e64855c75773768c81bf1216b4ceb2e8"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-063310-c825fa5/threedoors-a-linux-amd64"
    sha256 "4cfdf1afc3a1ad45a0c54d92198b5a20d333131b50432a56a299e41f914f828c"
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
