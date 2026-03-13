class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.225839.00665a2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-225839-00665a2/threedoors-a-darwin-arm64"
    sha256 "6cdbf779eb92f8a44485823fe9f9cbd087bce0057570cb9199a8e7767b68ccf3"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-225839-00665a2/threedoors-a-darwin-amd64"
    sha256 "f47dc268cab1dba741582dbf25f1b73820286a96377aac2216a7c3cf033029da"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-225839-00665a2/threedoors-a-linux-amd64"
    sha256 "fb84b4e0b572f974dca0a4464a0c08499dcebe1f2542f7e3aa2562572828de2e"
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
