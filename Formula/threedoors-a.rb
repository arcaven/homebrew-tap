class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260402.211338.7da5eac"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-211338-7da5eac/threedoors-a-darwin-arm64"
    sha256 "e3cf126e209f092204f699979c56bf024a26bd57aff044f6f58fadd61b38d63b"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-211338-7da5eac/threedoors-a-darwin-amd64"
    sha256 "3c9c912fec0fdd040f6cadd372db07d114ec949346a458ed3fd43e5045ab24c6"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-211338-7da5eac/threedoors-a-linux-amd64"
    sha256 "677169b0055686560c3469218b9bbfbcf9adf3203785c7447026afa49d7d043a"
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
