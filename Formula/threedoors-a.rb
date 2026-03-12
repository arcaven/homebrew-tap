class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.034227.bea8170"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-034227-bea8170/threedoors-a-darwin-arm64"
    sha256 "5e7cefab8c974360d44ddb522dadfc7c850ff462d948d405a09b48f0427f2c32"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-034227-bea8170/threedoors-a-darwin-amd64"
    sha256 "b3b57522512e1bc464567a621c5fc3d16f0bf94a40fe89bf757290e6b21aade8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-034227-bea8170/threedoors-a-linux-amd64"
    sha256 "194ceca3f7baf4184b7ad523fdd97b87ed4201efefae5708efae19a831382ceb"
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
