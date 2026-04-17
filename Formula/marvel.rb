class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.203119.55fb1cd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-203119-55fb1cd/marvel-darwin-arm64"
    sha256 "04e4e7b82e1f1123e328ceeb52ea3825b6efc206e05ef4ca286f28a215a9ec97"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-203119-55fb1cd/marvel-darwin-amd64"
    sha256 "74abb032332421740453d88935f181528d146625de91746a7089ac49ba28666a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-203119-55fb1cd/marvel-linux-arm64"
    sha256 "925620884b3ec4fe17a0e911173b01f63f2b3228dd015f1f27b416aecc0bbae2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-203119-55fb1cd/marvel-linux-amd64"
    sha256 "7e00243f7d62fa8cbe95cd2e5a90ebffeefa49c70f71f8aac428282728ef1644"
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
