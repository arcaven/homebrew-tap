class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.e588c93"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e588c93/threedoors-a-darwin-arm64"
    sha256 "327883833ccd4177bcac2f0be753f83d77f9339fc9ac0f95fa19f93dab04b771"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e588c93/threedoors-a-darwin-amd64"
    sha256 "698bb97e65676c92c533b94d812dbafcc928c8f6f8434f8bff4bf08c9fe142a2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e588c93/threedoors-a-linux-amd64"
    sha256 "274b3956857ad3cf055528a3b55d3bf26189fc841eb1f58fd8fb3d6a5838a2ca"
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
