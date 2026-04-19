class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260419.064055.bf543e6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-064055-bf543e6/sideshow-darwin-arm64"
    sha256 "7f5b456f1205ad660014bb41760cf257d5aa26dc6466495b7aac1e408683f66f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-064055-bf543e6/sideshow-darwin-amd64"
    sha256 "ce7b2c9339c1957fcd92a78de69c68ac2ff1477b64f9b9ecf25fd96b85f7afec"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-064055-bf543e6/sideshow-linux-amd64"
    sha256 "4165e6480a31e050f1a6252dbc5e0a1ceb91f792345dcea6684133eb4f0039bc"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
