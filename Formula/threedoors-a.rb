class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.044152.a841480"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-044152-a841480/threedoors-a-darwin-arm64"
    sha256 "bbdf24277a9ec534985f9af5dd01df79f199fc66d406dda545f7dc69b6c0a05c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-044152-a841480/threedoors-a-darwin-amd64"
    sha256 "7378db02e3652db341c1305ded4372c23311cce2ae2eac9a76c99610de2a0be0"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-044152-a841480/threedoors-a-linux-amd64"
    sha256 "8f5e6fe7f7900671f2a94cf5d64b491011a09ad731084bea0e6e4364a754d175"
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
