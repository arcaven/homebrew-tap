class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.8d9da2e"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-8d9da2e/threedoors-darwin-arm64"
    sha256 "da695256d54c373742fd51eb8d6e3b0644a511d6c26ecba58eaba1aa077a8c3c"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-8d9da2e/threedoors-darwin-amd64"
    sha256 "68c57557a2c3b840608c4818cc1f6b367c4dfeadfffa5f8dbe6a45c69fd80fcc"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
