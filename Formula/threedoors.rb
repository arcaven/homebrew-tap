class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.cb90493"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-cb90493/threedoors-darwin-arm64"
    sha256 "0a3d0047bf6a72ef3fee3ef6a37f500d707124a978a2d70a774950bf311216f7"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-cb90493/threedoors-darwin-amd64"
    sha256 "10b87448a1316668ebb680c87fcd9256ad8b866f433c35e7c33699c634c0458b"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
