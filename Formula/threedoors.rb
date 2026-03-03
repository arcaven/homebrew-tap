class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260303.5a6d884"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260303-5a6d884/threedoors-darwin-arm64"
    sha256 "83b5ebdf770c6856f169faf5b138fc69699e4d30045aa9e42a356894b11da268"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260303-5a6d884/threedoors-darwin-amd64"
    sha256 "9c317c7042085a78366a4d86e3c5b9cd72bd068d540fcb3d979ed9923395e5c8"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
