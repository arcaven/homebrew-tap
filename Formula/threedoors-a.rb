class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.220730.76fa74e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-220730-76fa74e/threedoors-a-darwin-arm64"
    sha256 "ca84249ea8471ad04eeaf586b2b08e3641b1a317478825364e98af99b0e29055"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-220730-76fa74e/threedoors-a-darwin-amd64"
    sha256 "67bd064c1375b0656aecee1d6e9040f540d29e0d9a1aa0a9d597c5cf6a075a5d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-220730-76fa74e/threedoors-a-linux-amd64"
    sha256 "b076874a8fcb325875e7fae301e075cd93c774dde4b28e04f05f0d716a6b6641"
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
