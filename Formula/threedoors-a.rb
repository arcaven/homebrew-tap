class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.191627.70e2c89"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-191627-70e2c89/threedoors-a-darwin-arm64"
    sha256 "4cfd835d122e4087ef8c365aa2c6b55691b4c9adae32464f3da7d9734413b25a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-191627-70e2c89/threedoors-a-darwin-amd64"
    sha256 "ed2aaf87bd72900811b34565ec57cd22496656ef9ea623ce6ab58d5ccc5f19c8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-191627-70e2c89/threedoors-a-linux-amd64"
    sha256 "10cf94a71535b9b5b863d5b94775a44308dfaef60797f239e344fd50dba67055"
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
