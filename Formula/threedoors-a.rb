class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.064427.30fb3ce"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064427-30fb3ce/threedoors-a-darwin-arm64"
    sha256 "88e1529103c713653495940ea826a0edf38275c7d3039bf0d7e36fc55e6fb983"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064427-30fb3ce/threedoors-a-darwin-amd64"
    sha256 "43f03e06490836e74e74e84bd28726879bebc319ccaf9fde808ae115dc600028"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064427-30fb3ce/threedoors-a-linux-amd64"
    sha256 "1feb69b4c2b7a56aee1002822932d61893c902098693e1bd0802c37aa08cbd89"
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
