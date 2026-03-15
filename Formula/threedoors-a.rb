class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.221147.6bbfce4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-221147-6bbfce4/threedoors-a-darwin-arm64"
    sha256 "21c596c0dc6bde130c5a91ec652d859723b7b9928303f530f93b34f835dde16d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-221147-6bbfce4/threedoors-a-darwin-amd64"
    sha256 "644218b35e645919d84701a45835017f6e5d3fe3f1bd68c4636854a6fa2216cf"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-221147-6bbfce4/threedoors-a-linux-amd64"
    sha256 "bdbcd51be83223c7a82cc00385b6ec746be86a14616dacf0614196d89f9ae4cb"
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
