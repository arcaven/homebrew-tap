class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.1c08904"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-1c08904/threedoors-a-darwin-arm64"
    sha256 "252ff89d2d21413f79bcf97bca9a86783cde10a6226c54e2ee6208af5213e9dd"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-1c08904/threedoors-a-darwin-amd64"
    sha256 "5569045aef21309c496b8ba9f74bfc28a0764f5d2de8a6dc466289e938aa0e06"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-1c08904/threedoors-a-linux-amd64"
    sha256 "39d9ed1ae1994b5d535fd50bafe7e669d63b0c1b7e3829e4fe78ef402d7a3830"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
