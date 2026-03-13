class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.225053.a2bcb74"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-225053-a2bcb74/threedoors-a-darwin-arm64"
    sha256 "70d6c9b201b2c7a7670b554d8039154ab4b855dc70ebf00c55b2e7930b19e75d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-225053-a2bcb74/threedoors-a-darwin-amd64"
    sha256 "f02150f4840847861079b45fb711388fc019748617798fc685a22724b211e411"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-225053-a2bcb74/threedoors-a-linux-amd64"
    sha256 "6e9c05edcb249f94550b8a8350dd6d5aa27f9a899cf3d10b2178fca966fa941b"
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
