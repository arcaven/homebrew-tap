class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260419.94b7c59"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260419-014915-94b7c59/switchboard-darwin-arm64"
    sha256 "2e7dd804539f4045dd368cc79f326c150bc0b9639cb878db2d62051dae314dfb"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260419-014915-94b7c59/switchboard-darwin-amd64"
    sha256 "fc522cdf51211ba5dab4de4842ea89eeb782a464dac9fea5210924db9aeb09e2"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
