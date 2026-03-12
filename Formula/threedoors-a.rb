class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.220444.ce2872c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-220444-ce2872c/threedoors-a-darwin-arm64"
    sha256 "45c5b16e7c325a732dcbfe59ea84ce984f1e96b817635cae0d8920e10b3f1c78"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-220444-ce2872c/threedoors-a-darwin-amd64"
    sha256 "76e3716f30638c05cf7581e6eaf9a46dcd0c10e21d67227d556c9571cce96295"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-220444-ce2872c/threedoors-a-linux-amd64"
    sha256 "cde6a0ad522b2e151639df0928430f3615708e496388b1cdc6b2beab4c25d828"
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
