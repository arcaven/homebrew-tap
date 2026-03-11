class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.ddb507c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-ddb507c/threedoors-a-darwin-arm64"
    sha256 "15781570dae2371d8d0558467f12b0b1bc3eda703b1549b86622591674e3177a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-ddb507c/threedoors-a-darwin-amd64"
    sha256 "03e7956cff13f932132698179f9f9c26294ca36e263a4c390c9ef6c01b8945e2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-ddb507c/threedoors-a-linux-amd64"
    sha256 "3d78c7213d592e2f876184c9b52f0fc9ad6a7aedd4ca4d335d67b90f8df92324"
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
