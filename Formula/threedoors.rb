class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.f47702d"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-f47702d/threedoors-darwin-arm64"
    sha256 "1c78a13998fa36d01ace441f0e51b242b17fa2c96ef762fd7c89473d718393fa"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-f47702d/threedoors-darwin-amd64"
    sha256 "f7e41ae3f2622ce930ddba09dedd7d8315bfefd42214d9172d5a2ec00c8da516"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
