class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.022718.1f943e1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022718-1f943e1/threedoors-a-darwin-arm64"
    sha256 "2d77d9f9adb3f6ce314947792d59e3f6a7716a513443d18a6059d5a2224dda9f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022718-1f943e1/threedoors-a-darwin-amd64"
    sha256 "4093ebf8859448f064888ce66aae7eb8121e28075de104c287b9f3a6fefa04c8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022718-1f943e1/threedoors-a-linux-amd64"
    sha256 "533129632714ed93f1120c860a9cf052a0dca0ac4271101603dddeec99d2d962"
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
