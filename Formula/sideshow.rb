class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260426.211024.87c0065"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-211024-87c0065/sideshow-darwin-arm64"
    sha256 "58b7a03499214201f8f8ff271516f0bc942965024348bb90c667d72f89fbafef"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-211024-87c0065/sideshow-darwin-amd64"
    sha256 "a863bf82920ed507f78f261d67078e338263993854fc6e6777b9232938c27f9c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260426-211024-87c0065/sideshow-linux-amd64"
    sha256 "d60dfef814e69a3791451545d44c6adec990027a6101a06f8b286300434559c9"
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
