class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260319.020458.3f9b512"
  license "MIT"

  if OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-020458-3f9b512/threedoors-a-darwin-arm64"
    sha256 "b29731112f578cb6467878e21e703bad47aed71660b741f6bdd5f2af10038bd5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-020458-3f9b512/threedoors-a-linux-amd64"
    sha256 "a7e0d3f3e0ffa3c3e3a0ff38a6804dab5a44cfd2bd6825d6dfe82a7aeb081642"
  end

  def install
    if OS.mac?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
