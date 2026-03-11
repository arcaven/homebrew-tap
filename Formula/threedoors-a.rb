class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.2e93927"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-2e93927/threedoors-a-darwin-arm64"
    sha256 "6dec15ca2df096d36a84f773c6c340029b71dca5085236a6905af93321f070b4"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-2e93927/threedoors-a-darwin-amd64"
    sha256 "dd6b961fc8e88841bdf75540f81cc73a89b91575bf8ac40f4e199df7b9468a67"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-2e93927/threedoors-a-linux-amd64"
    sha256 "12f6eb07d392f35c8d0313f9d39d8f0af300d981645784841447c65721769aba"
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
