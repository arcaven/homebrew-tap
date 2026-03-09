class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.c72dadb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-c72dadb/threedoors-a-darwin-arm64"
    sha256 "50e407e99794ebdce810b7f51dfb0d005acccc2ee02035548ff5b07803cd761f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-c72dadb/threedoors-a-darwin-amd64"
    sha256 "bbe62e1dc5a974f504d2f8b53b4e2494e245674653516f2904856bd3c3464232"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-c72dadb/threedoors-a-linux-amd64"
    sha256 "de71521cd7b965cd6aa913633a2ce13296fff24b673b592ba6701c8f428c609d"
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
