class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.3333b23"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-3333b23/threedoors-a-darwin-arm64"
    sha256 "f807371a053a8b472aa0986d7451842df4702310d6252f7011ac13926513e06c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-3333b23/threedoors-a-darwin-amd64"
    sha256 "29e358084be74ba6c9a60418bb8e0065cd3c68a97e8910563d4eb7345ada55d0"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-3333b23/threedoors-a-linux-amd64"
    sha256 "543a56e540ce742330c1447922d849edda7c0fdfab45718f7a61107227c75633"
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
