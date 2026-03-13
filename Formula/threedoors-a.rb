class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.184056.65f025b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-184056-65f025b/threedoors-a-darwin-arm64"
    sha256 "9ce170063a23a7522158c7a9a54637ede5de1b289dea6d4eac17b241c658ac45"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-184056-65f025b/threedoors-a-darwin-amd64"
    sha256 "8a88a936e1a6402543f35241b5b3aac0fdb2e033c15bd3ce6e7ff7ca697bc439"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-184056-65f025b/threedoors-a-linux-amd64"
    sha256 "3040338d82792efc026dd95fb96897cd9ecca4814912e7ce3db8d613f9bb077d"
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
