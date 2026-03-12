class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.235626.02eac7e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-235626-02eac7e/threedoors-a-darwin-arm64"
    sha256 "e4a3133c4e31634386946161dc3e1a0494b7621112f92e681e889c36ce64e08c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-235626-02eac7e/threedoors-a-darwin-amd64"
    sha256 "b7b073d52d8d31fb06a9efd4e7fcd703453ebb2fd06ee5a0a6678f0fa3c774ae"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-235626-02eac7e/threedoors-a-linux-amd64"
    sha256 "7f55ea87b7414b11bac34e90ac7e83b40b5fbdfbfcafae0ec529bce47969af19"
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
