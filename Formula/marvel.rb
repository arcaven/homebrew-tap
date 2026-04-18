class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260418.025039.50c78ae"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-025039-50c78ae/marvel-darwin-arm64"
    sha256 "cca0bbf532fe8d38a625a6cc327db0208e29418e68a69e2383723ff63c95f456"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-025039-50c78ae/marvel-darwin-amd64"
    sha256 "cc81f00a6492e3aad52f3c5e0586beda418556a3f0827f1bc081f1c0c3c0ccae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-025039-50c78ae/marvel-linux-arm64"
    sha256 "30b6d1f16cb66c846c4e016d2d9858f2e9040eeef5b0544e32e276fe6fd12316"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-025039-50c78ae/marvel-linux-amd64"
    sha256 "e8544e1fff781520a07a723ae387197abe68bce6055baec3afc297f3ce04d97e"
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
