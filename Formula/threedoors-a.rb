class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.223132.f100e15"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-223132-f100e15/threedoors-a-darwin-arm64"
    sha256 "9bd3b84c3d26917be46f37955e10f665ccc3d01e4a0f759880663cc629b26b73"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-223132-f100e15/threedoors-a-darwin-amd64"
    sha256 "06e5916f7732ea77347020a316f96f134ddcefd89218527028eb42dfbce297ad"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-223132-f100e15/threedoors-a-linux-amd64"
    sha256 "d1aa44e12cb80a0a9b89b650a82c2f980612a56a0b3ae4fb80b6390a4ed8457a"
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
