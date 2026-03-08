class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.8282da1"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-8282da1/threedoors-darwin-arm64"
    sha256 "950fb2d2141f3aa0dbc082224a87f17f8d7f7909999137132d82500deba0edd7"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-8282da1/threedoors-darwin-amd64"
    sha256 "1db4adbe42ac7074b0db0a569852cf57098840101c7d92b1d15713cf04c3c27c"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
