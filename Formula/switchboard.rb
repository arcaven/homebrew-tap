class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260418.df8e168"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260418-010357-df8e168/switchboard-darwin-arm64"
    sha256 "45ec3bbc8e388029e224ebac4264638b930ab25eb1a1f916856a09aef33d4228"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260418-010357-df8e168/switchboard-darwin-amd64"
    sha256 "605d652a73c2574e8b6eade5524708b582a98c72bf72e294d8f02ffb0bf01903"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
