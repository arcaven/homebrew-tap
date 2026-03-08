class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.f828eea"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-f828eea/threedoors-darwin-arm64"
    sha256 "6529a7cd5bf807c150772858035c527b133bb16c313f5ae56823aeb812fbd0ba"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-f828eea/threedoors-darwin-amd64"
    sha256 "edec2ed523242c9eabe10cc135c59fed3140b5e1e5b9ca5a23bed73d5a1871a1"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
