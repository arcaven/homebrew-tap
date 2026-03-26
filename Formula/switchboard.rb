class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260308.b566a6d"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260308-b566a6d/switchboard-darwin-arm64"
    sha256 "2d9762cefeafe90c79cd354293c1060915f8cd60c1529e4bc87529af084bfa83"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260308-b566a6d/switchboard-darwin-amd64"
    sha256 "be7b66da91225d63a78be1f11d0157e66d7a92833d688c0699f3e344c3435920"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
