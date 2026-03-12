class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.033903.f39defe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033903-f39defe/threedoors-a-darwin-arm64"
    sha256 "19f83396b4a12daf38441015954e493fe811c0250bcbf580fd699f6f08dfe68f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033903-f39defe/threedoors-a-darwin-amd64"
    sha256 "e47240179a15aedb52bbcc0d57349ed13cc540cb12ef956d9e1595da5ada6ebe"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033903-f39defe/threedoors-a-linux-amd64"
    sha256 "313dae32f5c0e7d3e98379bb65ec25242e16e18ee903cc016ac5af5c7e7f2c34"
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
