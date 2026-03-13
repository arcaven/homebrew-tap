class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.154946.714badb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-154946-714badb/threedoors-a-darwin-arm64"
    sha256 "b1b0212361e93666aad89525bf822b65a96f4a2214eea415598014d5428b369c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-154946-714badb/threedoors-a-darwin-amd64"
    sha256 "bc0a4e4a933904a4a6c54db09a13b12fc39bf4fc842bdcadeceb48b9ea901e09"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-154946-714badb/threedoors-a-linux-amd64"
    sha256 "996f8529b29b6c8c35a8f498390e39d860b45666092ca68692aeea58f5f93a8a"
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
