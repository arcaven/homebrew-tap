class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.204735.c468352"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-204735-c468352/threedoors-a-darwin-arm64"
    sha256 "8fed6dbcfe343e1d3e9cbb70500c2235743970ffdad974ab5abf1bcf14341dbd"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-204735-c468352/threedoors-a-darwin-amd64"
    sha256 "92aee07e9d4fdd7765dd0ea0f09318b8b1900758b80b87cf6455d81a6ccd1d52"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-204735-c468352/threedoors-a-linux-amd64"
    sha256 "5a5eb7c998b364374dccf1b7294c17990734853a09eaacb768aa12443d41e017"
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
