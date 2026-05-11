class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260511.356fc4b"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260511-165320-356fc4b/switchboard-darwin-arm64"
    sha256 "f64b664887f9a4c9b19234cde144ffbc315c73e955681fee9a76de24903a708e"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260511-165320-356fc4b/switchboard-darwin-amd64"
    sha256 "54c9bb8361e5ebe9d40dcba6b8965b4221debee910478c1329e864184c352d59"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
