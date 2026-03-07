class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.0375482"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-0375482/threedoors-darwin-arm64"
    sha256 "190244e722fad9b7be3f3b4a11fe89ba75cd08a2b5d469a1c750d8328514b92c"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-0375482/threedoors-darwin-amd64"
    sha256 "f8200268c61b874dabf5f203693421e9f40f3198079b235f1331de679295591e"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
