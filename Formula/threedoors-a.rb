class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.032219.840bdf2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-032219-840bdf2/threedoors-a-darwin-arm64"
    sha256 "657fe9124e56bc7ecd57574cc94d98c9eb98a6c3060c4e8269949573b6a2e323"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-032219-840bdf2/threedoors-a-darwin-amd64"
    sha256 "ed09aea3a04cb20502a01a11d6076a2c67d17d614a7830f170f445a94882b311"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-032219-840bdf2/threedoors-a-linux-amd64"
    sha256 "a64b91caadb730cf81b7af0d49254069f8e2438cc93fccfe0d783214469d383b"
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
