class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.8d78cf6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-8d78cf6/threedoors-a-darwin-arm64"
    sha256 "2f45fc865c899fe72614818ad782aba1a8023973001c108944d3cebb6ed12585"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-8d78cf6/threedoors-a-darwin-amd64"
    sha256 "26359b80d2274f58c0069ee63406aa26f1a702580fd86634e8e614663279dddc"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-8d78cf6/threedoors-a-linux-amd64"
    sha256 "b088e7c133049733cbca88394a0c76749857636867dcb0112af27d886739ec9a"
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
