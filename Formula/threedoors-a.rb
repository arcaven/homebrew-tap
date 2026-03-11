class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.7e77a83"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-7e77a83/threedoors-a-darwin-arm64"
    sha256 "63799d3724602865632827da0cadca77e57d3eec25dea412468626673417f54a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-7e77a83/threedoors-a-darwin-amd64"
    sha256 "e74e2011171569b543081cb499ce1ee1a48f7c3736fa8791418f7b480cdd534e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-7e77a83/threedoors-a-linux-amd64"
    sha256 "b6b3488fa376a45b20cbf790e4b88d8c8e06abd0e08189043c8f538bf585bb62"
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
