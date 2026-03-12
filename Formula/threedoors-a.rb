class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.195826.47918cf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195826-47918cf/threedoors-a-darwin-arm64"
    sha256 "e55953e3fe488f895f69dbfdb19067d3786ec5ad38fef5cb62d6a40931576736"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195826-47918cf/threedoors-a-darwin-amd64"
    sha256 "75c69acaecefd0c9931ba8bd62614937462f44587e6690f778562299ef6438a8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195826-47918cf/threedoors-a-linux-amd64"
    sha256 "44196e7502767e992593bbe2b90f243422bccaae85ccfc441e19029384f70a08"
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
