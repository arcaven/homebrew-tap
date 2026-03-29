class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.174003.722efce"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-174003-722efce/threedoors-a-darwin-arm64"
    sha256 "911c3b823cca92a66b1524670ef69581746bc1bb4d1df842252c5f4329cba738"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-174003-722efce/threedoors-a-darwin-amd64"
    sha256 "e710516c5358b63f63014d64f00653d5cfba3384d1ae5e470b4d64d500335647"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-174003-722efce/threedoors-a-linux-amd64"
    sha256 "f667380a6c41791d97fcbb737dbed6fbe697527d40069f4d1b304bd35d4d7f72"
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
