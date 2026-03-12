class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.143905.f170167"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-143905-f170167/threedoors-a-darwin-arm64"
    sha256 "116a2b7cb015dcc13806e83a064a3e8f9bca1b4419181ef8c495e66c4da51c3c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-143905-f170167/threedoors-a-darwin-amd64"
    sha256 "fb844ad7400be96b500e4708b3badef1b38689df1cc0b7ff204fd7872edca6d2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-143905-f170167/threedoors-a-linux-amd64"
    sha256 "f5c58dc46ed29b4ef62544b78a6b69198566e7d120ac5857c5293b6b4e21e75a"
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
