class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260506.c03eafc"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260506-211427-c03eafc/switchboard-darwin-arm64"
    sha256 "4b2ef2a42afe601e2a2c6f2500525d97f6aea431938dcca2547a4c4ecf1fb61b"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260506-211427-c03eafc/switchboard-darwin-amd64"
    sha256 "a5870dcf78edb102e677b46ce1b9d84dccbe76bb049cd7e7fd1a7bdff8d08620"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
