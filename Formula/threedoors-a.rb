class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.6f0ee23"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6f0ee23/threedoors-a-darwin-arm64"
    sha256 "375e0d9b93445323ba5593dbfb9e3021a4c4ba50f6c544e26d28da575f60e8e2"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6f0ee23/threedoors-a-darwin-amd64"
    sha256 "a1227c04afb44e3949d23e795b6b288b41025c3526a4f3f784ba2b5328cb7756"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6f0ee23/threedoors-a-linux-amd64"
    sha256 "11be194b5c5f9881182db121fc9969aef76cfd35730ade2f92632e9f6fb0e334"
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
