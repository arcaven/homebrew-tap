class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.0277ea3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0277ea3/threedoors-a-darwin-arm64"
    sha256 "74faf5b2955ab538599440a5d029967bc1b3173798887e37ce929b64ed84e30e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0277ea3/threedoors-a-darwin-amd64"
    sha256 "0ea5cdb28abe3ff2afe970b51f3a058f8b3a7cd159d9e3e518a1e66c10a6c5a1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0277ea3/threedoors-a-linux-amd64"
    sha256 "44baa7c6e83ac37022f95c603419e16c1f7859f934627ec6b6eb1c2bb3dfed7c"
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
