class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.011823.2f120ed"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-011823-2f120ed/threedoors-a-darwin-arm64"
    sha256 "6f543d9174ef031f4fa5b08c213e210d39b345fc183032d4732611994d2041ef"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-011823-2f120ed/threedoors-a-darwin-amd64"
    sha256 "e7251ed737cc5e2b740aa62bc15c6972c967ceaa620bf795309d55ef57d754f8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-011823-2f120ed/threedoors-a-linux-amd64"
    sha256 "d099825346a31f7924fe66150675c309b3443788d20acfc0910c1622f958ad04"
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
