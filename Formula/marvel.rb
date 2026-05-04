class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260504.031239.fd728e8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260504-031239-fd728e8/marvel-darwin-arm64"
    sha256 "c48108bde29a001b1263c3bc5723e19361d63da7b586d7468e5ee8b25de50c4c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260504-031239-fd728e8/marvel-darwin-amd64"
    sha256 "70ddd27b28ccefd6e36f077e013a8b5e865d96c607f4f79ea30af608e64639c0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260504-031239-fd728e8/marvel-linux-arm64"
    sha256 "7777c7b65e774738cb1c5b8eaa047e0138af7f0dfa31177fba6b08a44255be51"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260504-031239-fd728e8/marvel-linux-amd64"
    sha256 "71501d284c3cee6b55a3161ec51ec58038c171ee98b2c8b8821be6c568b75967"
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
