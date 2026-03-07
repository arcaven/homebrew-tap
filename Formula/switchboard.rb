class Switchboard < Formula
  desc "switchboard"
  homepage "https://github.com/arcaven/switchboard"
  version "0.1.0-alpha.20260307.672eadf"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/switchboard/releases/download/alpha-20260307-672eadf/switchboard-darwin-arm64"
    sha256 "ffdd95a275d739250cc8d1adbb5eccb3f10890c6dad853f90c773272532a1fc6"
  end

  on_intel do
    url "https://github.com/arcaven/switchboard/releases/download/alpha-20260307-672eadf/switchboard-darwin-amd64"
    sha256 "c32dec6af95def543593dfc77cd3e2102fc61f74feb99a104d84d26da6c7598f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1", 0)
  end
end
