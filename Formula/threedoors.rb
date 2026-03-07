class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.9dc4bca"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-9dc4bca/threedoors-darwin-arm64"
    sha256 "9a578a4eec8e4100ccb3c2012da5a3cfed6da47c6cfb09c64ce09173836208cb"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-9dc4bca/threedoors-darwin-amd64"
    sha256 "331a7ff8f3dbdb1544df1fb2e87213c5de7fff0bf493941dfda377404ccef49d"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
