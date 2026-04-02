class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260402.234544.819085c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-234544-819085c/threedoors-a-darwin-arm64"
    sha256 "3bda9ee5270157a6db32dfc9b431725fa73f6953a55230a1de1b5526ac568c00"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-234544-819085c/threedoors-a-darwin-amd64"
    sha256 "2f5677844dffd21ed5eb8ee2da2433ce2c44f21705dcdee74b0b6702664f474d"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-234544-819085c/threedoors-a-linux-amd64"
    sha256 "73d92b3fe97861f08a0f431138131fabad987371dc2b9185516c3530aaacdf2f"
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
