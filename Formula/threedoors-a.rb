class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.210009.88b1d02"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-210009-88b1d02/threedoors-a-darwin-arm64"
    sha256 "89ec79f8164ac9544c1a7b3d2e1e917a85c7a8a3e39ecf60168b9f5931192e97"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-210009-88b1d02/threedoors-a-darwin-amd64"
    sha256 "6652c30e3b0586ed563c09fc33dab74c61cf58192132eb58cf027325e75d1e4c"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-210009-88b1d02/threedoors-a-linux-amd64"
    sha256 "79fa2b5933cc88729b4046c065b699f00cd84334182a2a43ed958440f21d4233"
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
