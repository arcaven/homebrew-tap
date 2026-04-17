class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.204149.c1ca35a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204149-c1ca35a/marvel-darwin-arm64"
    sha256 "4de98564569b704a68d165ef7fec98aab78bcdf77750e13eaf61616e68925df2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204149-c1ca35a/marvel-darwin-amd64"
    sha256 "d1b83cd024be9da808f32fa64e0f9151402c0f117c309edec24ce818db871768"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204149-c1ca35a/marvel-linux-arm64"
    sha256 "36cc9154f419c9cce51eeb86ddb3bbe8a967e9f5e997f79c5b030613fd552d7c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204149-c1ca35a/marvel-linux-amd64"
    sha256 "2d83fd6f3da819506ae31b864821a4bcf2e7a37fbdae612abf318f3aaa89d963"
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
