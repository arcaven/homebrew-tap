class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.2aac82c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-2aac82c/threedoors-a-darwin-arm64"
    sha256 "1d67e20e92b1eecebe96bea0fc890887bc71cbc515d2777bab25af2ad5c5e98e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-2aac82c/threedoors-a-darwin-amd64"
    sha256 "cb0f69eecadf0d7f97f25b8dcca4d988bdbe61887e3c7524a9793011309f7d49"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-2aac82c/threedoors-a-linux-amd64"
    sha256 "a431581a0c762595f059cdc9d8807ac662ed696b22129aecfd12b0f5e1920d7b"
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
