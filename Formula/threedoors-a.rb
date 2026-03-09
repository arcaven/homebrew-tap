class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.a654cd9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-a654cd9/threedoors-a-darwin-arm64"
    sha256 "f97be3860544e8af5404f979f9ee80a7448d294f297e11865f62e93030f17c65"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-a654cd9/threedoors-a-darwin-amd64"
    sha256 "fdfaf2c8702343422378ff776404e97f47984558f001198be171e33378c581ad"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-a654cd9/threedoors-a-linux-amd64"
    sha256 "5a87906fa058504e69e3d28529fc9fa458a4baa0430337391738edb0125b84a4"
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
