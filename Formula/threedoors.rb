class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.117e5fb"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-117e5fb/threedoors-darwin-arm64"
    sha256 "bfb7356136d2e01b2d71456644a81de34c09724a4d6ca96d3f9a67595d409b35"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-117e5fb/threedoors-darwin-amd64"
    sha256 "9d9e82893eee9d6f0a15d6fdf93b95c6dcfaf6765dea4bccb112300f5a109869"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
