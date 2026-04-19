class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260419.30896cf"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260419-053853-30896cf/switchboard-darwin-arm64"
    sha256 "cbdfef73a70ee30262cfd6f6f1298dc22883950a8644b09fd0776304f06e29a4"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260419-053853-30896cf/switchboard-darwin-amd64"
    sha256 "81d45854a148b14a45960fe978b1514c968cd870e4ba0c3d14808d5c4ae97e8b"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
