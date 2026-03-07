class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.677dc95"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-677dc95/threedoors-darwin-arm64"
    sha256 "6681b0bc83d85fd4eded10367c27d5601512cb27e252ab56a726a491c2ba9508"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-677dc95/threedoors-darwin-amd64"
    sha256 "4916355d58bf6e34384e81a814bfff9f619ec8ba7696bffa4ac44140ce4f5973"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
