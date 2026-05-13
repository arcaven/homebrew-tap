class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260513.194707.f30e65f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-194707-f30e65f/sideshow-darwin-arm64"
    sha256 "e269c601be5bb3ac7abd996975ee34c4d348bcdebe979da1e8cee2cc03ad9467"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-194707-f30e65f/sideshow-darwin-amd64"
    sha256 "9ff1764db69b87a0bd3b3a7e0da2dada2333a5cd4ab946327ffe9d4b1cdd5162"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-194707-f30e65f/sideshow-linux-amd64"
    sha256 "885748c38a5e7f789ddc91847f7f17f5d1e1a8b1ebf50ff36f5ddd49c54d8b7c"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
