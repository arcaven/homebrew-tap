class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260504.031108.470d61c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260504-031108-470d61c/sideshow-darwin-arm64"
    sha256 "d710e4d60bb321ba1de1521689585254ee1ef34961442e4a7c9cf860d5a94cc0"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260504-031108-470d61c/sideshow-darwin-amd64"
    sha256 "90ac814f9f8567e3c7b894566441402797edc549980683f766b7e66601b24208"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260504-031108-470d61c/sideshow-linux-amd64"
    sha256 "4ea6e686d79a93a7e2d6b1da2c3cace77581a4d9b0ab9a555c0bf58557b23da2"
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
