class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260506.30f80ce"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260506-193657-30f80ce/switchboard-darwin-arm64"
    sha256 "72141b670f7de82286da1a306fe4be229a196eaa9b79624ed54e7a36098636ef"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260506-193657-30f80ce/switchboard-darwin-amd64"
    sha256 "4d5c6d361d8a1aa9c2c8046389a31facdaddf9a850e64465524c6c5a76c11c48"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
