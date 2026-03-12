class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.000625.eeb182f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-000625-eeb182f/threedoors-a-darwin-arm64"
    sha256 "4b92b05f524cb34faff90d48fe4a371fbf7213a34943331fc7d21c14195484ac"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-000625-eeb182f/threedoors-a-darwin-amd64"
    sha256 "9621fd40cd9c409c5f31c4f7b129dae8525d28f0b78ede40dd40cf646bdcb882"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-000625-eeb182f/threedoors-a-linux-amd64"
    sha256 "f01b6e49de5addd66f855154588028d03472e5f6f67e18ce3152e2dd78f760e4"
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
