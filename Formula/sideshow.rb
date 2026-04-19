class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260419.014910.2a4dd5a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-014910-2a4dd5a/sideshow-darwin-arm64"
    sha256 "be536404e7179888375a2db5bd4e1dfb7a105adfbb496bdabfc154dd9bdeaa45"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-014910-2a4dd5a/sideshow-darwin-amd64"
    sha256 "0bb31a885ce392f31ba984569a94b4975da8ad2fabbef80e088242d61d1b0f74"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-014910-2a4dd5a/sideshow-linux-amd64"
    sha256 "f38fb167a5cb7bc17f86c371e202cbaf4eb5df1b70bc9ecbec1233bb2f59ce7f"
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
