class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.6fb6aa3"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-6fb6aa3/threedoors-darwin-arm64"
    sha256 "5e61bbf23aa315b11ef0a7b1150a3dfcba1b7497832f77944e0158a78aac4c11"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-6fb6aa3/threedoors-darwin-amd64"
    sha256 "9dadd35af1b8e52798e03b1ada4b38c54a8341f9f12c4b29737cd53f8239a84d"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
