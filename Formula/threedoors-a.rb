class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.18a5c46"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-18a5c46/threedoors-a-darwin-arm64"
    sha256 "909bd11acfa5cfe937955e9c2459b3d05eb8db6390eed4fc497a40bbc731d446"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-18a5c46/threedoors-a-darwin-amd64"
    sha256 "ef8e3f95df5f71f1c8eb15718105819b3f0e6d09c4959cc9b388742898f586e7"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-18a5c46/threedoors-a-linux-amd64"
    sha256 "bda07324903aad324331f14b6a5ee9c5468a3c942ed9072f1c57f82fd09ab6e1"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
