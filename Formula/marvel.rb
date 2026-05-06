class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260506.222218.2b11b43"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260506-222218-2b11b43/marvel-darwin-arm64"
    sha256 "9206ad59c9a341b4056e9b7ea6d983cc2cd063160ec92f7ecc5d6b5c333fe348"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260506-222218-2b11b43/marvel-darwin-amd64"
    sha256 "7a5cad95c63f1a3861ab2494b040fc261d5e65d027e85894f1e4188c9c7627bf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260506-222218-2b11b43/marvel-linux-arm64"
    sha256 "269258307a0416655734f51a2da2d55136debf45692ff35a01723baba13c3003"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260506-222218-2b11b43/marvel-linux-amd64"
    sha256 "b3bf84760f3cb589940222811fdff48f1b66d7d89ded8ebdd872cba80f202170"
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
