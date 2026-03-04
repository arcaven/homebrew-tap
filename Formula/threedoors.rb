class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.8c80f48"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-8c80f48/threedoors-darwin-arm64"
    sha256 "3b5337994cf567c649a40721317d70d7dd50dca3bb412d29abef48285e218e8e"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-8c80f48/threedoors-darwin-amd64"
    sha256 "35bb0212c8914d9c9adaa02d1cc107ffcb0c7d435b7d48bae955efcfb1ca2942"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
