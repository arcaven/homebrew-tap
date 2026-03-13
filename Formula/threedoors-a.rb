class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.234034.a406e64"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-234034-a406e64/threedoors-a-darwin-arm64"
    sha256 "e4ba466e9c07789f4bf49a1cad75deab527ea63cf87b7725036979c8b258b3c7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-234034-a406e64/threedoors-a-darwin-amd64"
    sha256 "36cef7e2cccb797ebe8f1bc1056751f7724ba393698a4d03dca26177f6396a45"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-234034-a406e64/threedoors-a-linux-amd64"
    sha256 "4b02332e8740fd87125b3b5f65eccbdf3ce44c5e9834957699c7b9aa11338eb3"
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
