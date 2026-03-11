class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.cfaf3ab"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-cfaf3ab/threedoors-a-darwin-arm64"
    sha256 "1a4fb3dcaff9b24de9d9577ede223265575e0e20b189f96d2919b05788b71694"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-cfaf3ab/threedoors-a-darwin-amd64"
    sha256 "cce652964a719e22cf5d898f1eb341cecd4b2908267a47950843a05e86474522"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-cfaf3ab/threedoors-a-linux-amd64"
    sha256 "b412fec4049cc3f2458a4304cf43f5d58fc5b66ff10fd9f7475890cecd0b5a25"
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
