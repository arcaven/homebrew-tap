class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.153704.b457ecf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-153704-b457ecf/threedoors-a-darwin-arm64"
    sha256 "311651a1c34dc68ad233843bce95f954df6777faa980bc65251e69b6544375a6"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-153704-b457ecf/threedoors-a-darwin-amd64"
    sha256 "cdd3675839ffbbe67f30f4c1b3a77a8d1d8af72b87cda34c194a09a5934e2769"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-153704-b457ecf/threedoors-a-linux-amd64"
    sha256 "16f411429b0183f61697933b43f22c0105425d48f3d89d4e4f51b1a846ca4c7e"
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
