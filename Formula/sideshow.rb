class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260412.023848.b9394f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-023848-b9394f7/sideshow-darwin-arm64"
    sha256 "e43a3d839676d32ee78c948abb7ccaf8ff55feacb3be2a2a93f2adb7c0973ee7"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-023848-b9394f7/sideshow-darwin-amd64"
    sha256 "f5afeb837528156e54cf3c023f0cbcf530f303aabe47bcb8a99ab168a0754adb"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-023848-b9394f7/sideshow-linux-amd64"
    sha256 "e85a7147c0e0eb45ccb876f999f807e29539ecaff478812d6f607d51bceb62a8"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
