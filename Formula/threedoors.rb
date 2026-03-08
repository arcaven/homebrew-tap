class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.e05336c"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-e05336c/threedoors-darwin-arm64"
    sha256 "8ffccf6fb979e7f013b02abd6267a641341d511f03ddaefde536a55a2fad3614"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-e05336c/threedoors-darwin-amd64"
    sha256 "c6a98fb93f40a798f932ff10f7697ff3fa63147422c8e367694a0279f32320d5"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
