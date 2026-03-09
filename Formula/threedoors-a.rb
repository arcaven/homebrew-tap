class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.d48c556"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d48c556/threedoors-a-darwin-arm64"
    sha256 "7d78321910fc7aae08077a310fe6a52c4260d0d018f49d5bae616b6406b78a15"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d48c556/threedoors-a-darwin-amd64"
    sha256 "c83242baff9ab82e78015ea41b3ebfdaa9d5330b293cb3d1e11e696488448cfa"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d48c556/threedoors-a-linux-amd64"
    sha256 "c53377a43e12a2fa8869906a67b85c926e80d8a517fe91f5128ad85707038034"
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
