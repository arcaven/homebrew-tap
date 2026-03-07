class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.10b33bf"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-10b33bf/threedoors-darwin-arm64"
    sha256 "270e206dcc46291f624bc89432ed902d54f9c7c1367fd451f760daf74c8a09db"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-10b33bf/threedoors-darwin-amd64"
    sha256 "e735c098c6ce0783aa290c2a650caeaeb002de804f4dcd0f6f695cbd05cfe777"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
