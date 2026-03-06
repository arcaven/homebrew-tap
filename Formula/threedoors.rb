class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260306.e693cfb"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260306-e693cfb/threedoors-darwin-arm64"
    sha256 "92f4fd389764ce7ff3d9bea153e561a378d4ba911e240745ff215ac4ec6aae68"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260306-e693cfb/threedoors-darwin-amd64"
    sha256 "59ba668460ce37d14d828ab34d01ed5ceee9a456c059d4f600e8d87239aa130f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
