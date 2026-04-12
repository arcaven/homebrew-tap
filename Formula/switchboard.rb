class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260412.34cea07"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260412-024453-34cea07/switchboard-darwin-arm64"
    sha256 "788545825867fb79bd67c36fca2b2cced5d14932b9dcce230ae953dd4ed21434"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260412-024453-34cea07/switchboard-darwin-amd64"
    sha256 "6d15eee48fbc5f8986958512f4331b2925c65499e6f26254325289058fe574ac"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
