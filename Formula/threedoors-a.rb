class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.d802086"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d802086/threedoors-a-darwin-arm64"
    sha256 "f97543cad3b723bfe16b34faeb685e1432d19e24b2b2f0b7195f7cf372e621fb"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d802086/threedoors-a-darwin-amd64"
    sha256 "e42bef0ee9d9d45f1877874daa367ab9fd84985b69a19e1d7b353d8a6e6cbf7b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d802086/threedoors-a-linux-amd64"
    sha256 "89e99e58aed3492a477a4342c70a3a2bcfdd32e6cb054cf8305e57f5e5b501e9"
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
