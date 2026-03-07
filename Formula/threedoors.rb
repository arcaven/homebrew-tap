class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.d254828"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-d254828/threedoors-darwin-arm64"
    sha256 "70c136632888cc4f314c49e3d34d47b9202ba7fbc59c0da84068a8e911a2ff7b"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-d254828/threedoors-darwin-amd64"
    sha256 "e9c488616565aea01999e649baebe5dac7c3f829f74cba46bd52e33c3ac1903f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
