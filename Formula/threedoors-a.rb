class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.204718.b69a7bf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-204718-b69a7bf/threedoors-a-darwin-arm64"
    sha256 "1b07d742dcc8c07beb60bea348d715cb9752f200b06744a9d2bbac458d7de65b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-204718-b69a7bf/threedoors-a-darwin-amd64"
    sha256 "fa9aa12cf2fcd457126ae9852163a24527e7010ccd6029e28f51b13cc4aa85ce"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-204718-b69a7bf/threedoors-a-linux-amd64"
    sha256 "77219eebd6dc6639f51d6c4fc7f213f9fb73e6ea69a75b6cdf9bae71a2c62bde"
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
