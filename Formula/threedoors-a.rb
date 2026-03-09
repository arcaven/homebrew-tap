class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.67c453c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-67c453c/threedoors-a-darwin-arm64"
    sha256 "20c825d88b0759e00d4f1165e58254c36539714af99f7090f5ff05c051a92c19"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-67c453c/threedoors-a-darwin-amd64"
    sha256 "fccd7964dc0702ff7c773398e8ce238a9926f393b1ad94409cdc58b36e5d12da"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-67c453c/threedoors-a-linux-amd64"
    sha256 "bf0b1f6277229f0d184b758fd40917a3f87b73976b9b9d783aa43bee12196175"
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
