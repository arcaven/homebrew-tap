class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.040512.b72898e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-040512-b72898e/marvel-darwin-arm64"
    sha256 "a05a6b91e67ade4f9698a38647434c5c7da95d15e91fc6ab9d5b7e254e22868d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-040512-b72898e/marvel-darwin-amd64"
    sha256 "06e0fb5fcb6930fdc82681858862aa8de5edf315445747888943da1252c58aea"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-040512-b72898e/marvel-linux-arm64"
    sha256 "5afebde3847c5da09020d40b26cf311dfe570559cc3c7058978b08479779a2b5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-040512-b72898e/marvel-linux-amd64"
    sha256 "5ec092f809499f20499908ad12faafee873a291ed3c63c7e6a89030999b9c1e7"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
