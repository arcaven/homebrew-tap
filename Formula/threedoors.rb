class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.b5fcfb7"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-b5fcfb7/threedoors-darwin-arm64"
    sha256 "308609516902c94a5bf1ea215a89fff8dfd0ae5bcca471f5dc42416365b553ee"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-b5fcfb7/threedoors-darwin-amd64"
    sha256 "483b02d30b8604f84b8e4e80c578bf104ed69875cd1b533ec7ce1243c27a6004"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
