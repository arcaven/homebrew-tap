class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.57d3a5e"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-57d3a5e/threedoors-darwin-arm64"
    sha256 "0daf2e28eaa77f6d2e831e5d1f819233b5af761c800a27bf2c8476d200ee5185"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-57d3a5e/threedoors-darwin-amd64"
    sha256 "71e50db27e22a7f84d30ee7607d174a4fd757c428615667b7a28d8e5f2faa5e1"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
