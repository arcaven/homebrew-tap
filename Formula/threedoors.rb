class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.543daeb"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-543daeb/threedoors-darwin-arm64"
    sha256 "78735072ae05c4f8bb4c77eb7d98d429ef7bee283b4e85afcf20659f995376f1"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-543daeb/threedoors-darwin-amd64"
    sha256 "d399fdf8621e6be55206b8ffbde08a0764afa51782b1ed4fbf5bbe907416f5a3"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
