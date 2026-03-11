class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.1884045"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-1884045/threedoors-a-darwin-arm64"
    sha256 "940682e0b700f0453f654f85192f76454e13f31d898cc5f019a109d5664477c6"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-1884045/threedoors-a-darwin-amd64"
    sha256 "b6c46a7099ff981a3179b845d1060ec02ab8868b5fff16f57a8f1ea720cd3c5e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-1884045/threedoors-a-linux-amd64"
    sha256 "bbd450d52e9f9c473419f48838a0762fcef2d2eb5828b78feb98b76eaac21484"
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
