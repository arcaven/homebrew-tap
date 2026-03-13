class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.210542.e9fc895"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-210542-e9fc895/threedoors-a-darwin-arm64"
    sha256 "7060a66e97017c720493a842d817355457e6033a569d6372026fc22bde9c87d8"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-210542-e9fc895/threedoors-a-darwin-amd64"
    sha256 "e0f935ef56919cf15d4a1e5fcb85ca9998e7ee37121bdf99be897231f07fe284"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-210542-e9fc895/threedoors-a-linux-amd64"
    sha256 "d85f05eb0c8f113bb691c13e64edefacf4083ed6bc579f35c11cc377d381d543"
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
