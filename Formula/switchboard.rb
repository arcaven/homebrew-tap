class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260422.8f31568"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260422-133554-8f31568/switchboard-darwin-arm64"
    sha256 "5ba2122d361c78272553d5a50f2953d70c80a803ac38a88174febdd31cdb7bd0"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260422-133554-8f31568/switchboard-darwin-amd64"
    sha256 "3831c2e19366e7304c273da5521021662abf5497a3e1adebcfdefb8de162f2a7"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
