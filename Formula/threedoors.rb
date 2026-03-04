class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.aa6ae36"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-aa6ae36/threedoors-darwin-arm64"
    sha256 "5ddbd89ab1053b3dc37bd3d4106c12a61dfa144bf72baaf5019cb2103d59cd7d"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-aa6ae36/threedoors-darwin-amd64"
    sha256 "b5ec568d073e7bc05ef8f118ccd8da67092703155dbe40b346422676c1811376"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
