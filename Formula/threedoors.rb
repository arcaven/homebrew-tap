class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.35448b5"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-35448b5/threedoors-darwin-arm64"
    sha256 "4e63e83e94571c3454a0921acf81fb23b694ab0c5c73471607bff51cdde0ba62"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-35448b5/threedoors-darwin-amd64"
    sha256 "297f7506e822b59df65beadf731b9c602b2bc984c9c7e15dc9c0d2f7d61e52bb"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
