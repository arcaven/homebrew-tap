class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.df47e37"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-df47e37/threedoors-darwin-arm64"
    sha256 "42e0d590bb59e4624f8edaec60481c020a9198ba0b5ccd0389b747acf3ee2f22"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-df47e37/threedoors-darwin-amd64"
    sha256 "1384888f2254c4fe0425671ec1ffdf734f76786950a29cc28f0317bb0463f68e"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
