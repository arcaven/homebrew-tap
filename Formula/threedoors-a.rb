class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.192005.3251169"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-192005-3251169/threedoors-a-darwin-arm64"
    sha256 "b074ef80de5267c66c877e804b914c700ea0208ee56e645de5d90217b361069d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-192005-3251169/threedoors-a-darwin-amd64"
    sha256 "cdd9ee747bca27e15f60ccd43528bd0b1e63598bf7d4f7f1add34f08b572f092"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-192005-3251169/threedoors-a-linux-amd64"
    sha256 "486e8665efa98cb8addd596807a57143fa359d3a78438a1f28522a61d87c2d45"
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
