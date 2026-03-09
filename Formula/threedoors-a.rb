class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.fc20c77"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-fc20c77/threedoors-a-darwin-arm64"
    sha256 "7f3950dbb5d42af01d264660625a278b1dc84c4fe125e638c0d760a0289cdb3b"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-fc20c77/threedoors-a-darwin-amd64"
    sha256 "84c3f442db9819ce0505bd9824406c8a8e01782a4fc189b89611569530d81346"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-fc20c77/threedoors-a-linux-amd64"
    sha256 "d71e47eb3c8609130474412a143f7f4cd798dc0a1bd9d2094598e77b5aa71293"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
