class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260513.032522.ba85e0c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-032522-ba85e0c/sideshow-darwin-arm64"
    sha256 "b5a9c6f652effd8ba962575ce7e8e1e8e4ec8bf9a6f8d51db15579a19cbec31f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-032522-ba85e0c/sideshow-darwin-amd64"
    sha256 "58a688b6f915c94fae4065239921d5d366c025a65114264b833e446067f6947b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-032522-ba85e0c/sideshow-linux-amd64"
    sha256 "e858179d8a3e7ac7b9636dd181d5ef54a658a47a9d4d98f19329b6059df088d9"
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
