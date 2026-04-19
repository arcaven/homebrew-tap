class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260419.014802.63ee934"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-014802-63ee934/sideshow-darwin-arm64"
    sha256 "613c0ba24f115adc3333225c40d56d6a4a45558d7d03ea8e64c6de62907af879"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-014802-63ee934/sideshow-darwin-amd64"
    sha256 "d0df05445bc961a24b27b0f490d4bd2683b773296f9ff5eecff32974cd23ee07"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-014802-63ee934/sideshow-linux-amd64"
    sha256 "c60d63d331abd10a93d509eff305868311b42d1384dde5fb3db8658748ba9bcf"
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
