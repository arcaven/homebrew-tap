class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.f2e2022"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-f2e2022/threedoors-a-darwin-arm64"
    sha256 "1e04100600c960b477da2dfa50264c68b6062a49844457a9da765e1f623a3757"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-f2e2022/threedoors-a-darwin-amd64"
    sha256 "6ec21a1fb7d93c69893b7227216da0f9563e607769e0aa4498d3d89d7ceaeee3"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-f2e2022/threedoors-a-linux-amd64"
    sha256 "76cf09493446e14ed27e79714f1b634505018be72b9a66cbeef08eb758e2f464"
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
