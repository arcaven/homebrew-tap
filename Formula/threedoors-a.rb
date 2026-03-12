class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.185458.44e335e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-185458-44e335e/threedoors-a-darwin-arm64"
    sha256 "81f45b741f28596076ab8f8c1214056ee28ab76c587345923dd9de89cf7810d2"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-185458-44e335e/threedoors-a-darwin-amd64"
    sha256 "56a1e85fcdbabcbe4dbf62f3d1f2c9fffd28ba2d68f8ce3e02c781e3b27fde51"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-185458-44e335e/threedoors-a-linux-amd64"
    sha256 "f917b642087e61bef236cd9edc5f398a57c91521af4ade054a3273051982173b"
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
