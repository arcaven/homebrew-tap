class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.200412.a08d457"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-200412-a08d457/threedoors-a-darwin-arm64"
    sha256 "4997042625cd7d00401d61a3e191eedc32d0dce9f4e279d0504db495e671e65b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-200412-a08d457/threedoors-a-darwin-amd64"
    sha256 "35943881c6097dae7d08339794b91dc315ac833c196ca1cb7c76df42b422a7fd"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-200412-a08d457/threedoors-a-linux-amd64"
    sha256 "b33abe10b5dec084bb61aaed88d5328ddc2d10f5af4340518ef2f0c370116753"
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
