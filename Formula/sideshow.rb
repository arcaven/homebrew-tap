class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260426.223119.c6bb14a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223119-c6bb14a/sideshow-darwin-arm64"
    sha256 "e09ddf70db83b5ce647cf71b90d08aacfcc3b0b52c6abbae272a675dc5fec4bd"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223119-c6bb14a/sideshow-darwin-amd64"
    sha256 "858a8c47c8e9a28854be6855895df8ba480407ed46201aca8b552360417a54a5"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-223119-c6bb14a/sideshow-linux-amd64"
    sha256 "4052ea3d75e03a213929df214f43242a53b561ac8ae79bb5b929840a17e989d1"
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
