class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.96f7f8a"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-96f7f8a/threedoors-darwin-arm64"
    sha256 "cebecb12c0ef809c4d3891d5dc1b8c6f3eea62885be2ceb372640023b80aaf1b"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-96f7f8a/threedoors-darwin-amd64"
    sha256 "0314b70da69fb67277c36ac250cfd5dc72a2ce96ba786bb22c81b7a9a85e6920"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
