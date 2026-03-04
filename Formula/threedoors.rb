class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.2816b63"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-2816b63/threedoors-darwin-arm64"
    sha256 "c201e56a54cd3f70f82ddfdfb464efa2f38cc6a833efab5b34a2a88d2b49b08f"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-2816b63/threedoors-darwin-amd64"
    sha256 "6320715cfb3d46e9de2a98a0160ce4bbde7bc62e62afd8e6ec3cb7ead9ed4b0b"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
