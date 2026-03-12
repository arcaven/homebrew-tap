class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.224310.6c731bd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224310-6c731bd/threedoors-a-darwin-arm64"
    sha256 "9e465748c502b64bb94febb4c82423581afbe94d567f6d14fd0d3d3396a35bc6"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224310-6c731bd/threedoors-a-darwin-amd64"
    sha256 "94c8203a9e1c86b0435f1f80937e3a6d9fa1141101661c288f1acf4f9b6b3df6"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224310-6c731bd/threedoors-a-linux-amd64"
    sha256 "120c6bc4fb0814ba531761a74fe3c282aa109e24f07c42d23698a34161f82dcc"
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
