class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.192746.fb86e60"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-192746-fb86e60/threedoors-a-darwin-arm64"
    sha256 "42706d305ae35d1269386a1dfa8f558c621e8baa72750e003614a10af67a737b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-192746-fb86e60/threedoors-a-darwin-amd64"
    sha256 "c07df8f8608f125c6ec31f4ffde7b4c43782761114c39860844bee18240be9cc"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-192746-fb86e60/threedoors-a-linux-amd64"
    sha256 "65d62e3efaf62d4716d97ebc88b958a3e10a14f07480846963985497f7722cbc"
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
