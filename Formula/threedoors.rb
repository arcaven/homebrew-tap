class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260305.e3a8421"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260305-e3a8421/threedoors-darwin-arm64"
    sha256 "cd25f8e81c99dacd8b94b831dc586c8718997147877db385dcf08365eed6fdc2"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260305-e3a8421/threedoors-darwin-amd64"
    sha256 "194c52c1217d9f6d0527a5c5442023914b0da00f9e211d2d4c15500e7d89685a"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
