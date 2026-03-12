class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.002649.efe6bd8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-002649-efe6bd8/threedoors-a-darwin-arm64"
    sha256 "15d1c73cd1421488f9b3f20c760912b197ce3fa3fd2b8c39ae2b53eac3b18c23"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-002649-efe6bd8/threedoors-a-darwin-amd64"
    sha256 "a8ddf6bea00de6d75fb017d8f170485fd8a67e46ce630c6909eaba5ab12c5339"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-002649-efe6bd8/threedoors-a-linux-amd64"
    sha256 "588fe2b0929766bbe6562f2d2fd54e8a498c97ed06c93b4e1bb7814614dc81b7"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
