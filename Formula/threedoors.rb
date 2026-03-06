class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260306.a6c3040"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260306-a6c3040/threedoors-darwin-arm64"
    sha256 "19861b836776ca58fabf7cd8564cdb33d481583f079d9fec6ffbfde2a96f061a"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260306-a6c3040/threedoors-darwin-amd64"
    sha256 "0dc964fe0cfda18c88b18778157b6a3912a5b8b953b8768208091eb9196fc5f6"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
