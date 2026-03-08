class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.948cbf0"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-948cbf0/threedoors-darwin-arm64"
    sha256 "cbc698418f25df2e6f2ecaf734fca1d04d9111fd563faf827ab01c3d67699fe7"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-948cbf0/threedoors-darwin-amd64"
    sha256 "f7b531c33f22ceee96762bd4ad011c54f95b554c6239fd00659d439dd2ed253b"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
