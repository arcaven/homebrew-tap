class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.0fc281c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-0fc281c/threedoors-a-darwin-arm64"
    sha256 "215f8666b1cbf627fadf46d40c0a055da046bcbf784b2ae488178621fb9eed63"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-0fc281c/threedoors-a-darwin-amd64"
    sha256 "b41bfd4fec58d6481dfb761947e95b8b509d200676dde8ca3f72b9cbc937f542"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-0fc281c/threedoors-a-linux-amd64"
    sha256 "3e78df37da9fefd88fcc386ffa3862ea1018c734a64a68dbd418c85c8eba52aa"
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
