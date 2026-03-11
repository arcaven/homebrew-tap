class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.ac20548"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-ac20548/threedoors-a-darwin-arm64"
    sha256 "a8423e4443769ca428f2938be2cce5eb3f7aec997966f1187063d7699f7a7431"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-ac20548/threedoors-a-darwin-amd64"
    sha256 "3cb134b74184953a341fd3604bc43d6465c9a2de790bc2dae5a44e51d9cc344d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-ac20548/threedoors-a-linux-amd64"
    sha256 "47c9d6cc9c59b88b93fec3a3557ced65347afe416eef938b392f90e7ad0cd1c6"
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
