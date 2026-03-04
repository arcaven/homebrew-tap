class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.988345b"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-988345b/threedoors-darwin-arm64"
    sha256 "f5f1103c0d57fb0269611fe779dd495b98a6109d673ddccdef821b3b26ac2649"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-988345b/threedoors-darwin-amd64"
    sha256 "89db9e9bdcf3a01b441ae8dc2a516071091d31150646a0a0130ab58449aaa4e4"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
