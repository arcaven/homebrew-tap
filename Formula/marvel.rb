class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260418.024746.0dd0d53"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-024746-0dd0d53/marvel-darwin-arm64"
    sha256 "1be957077630ffe44212378596f21ed02498931c1ca2f6a2162caedea6299343"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-024746-0dd0d53/marvel-darwin-amd64"
    sha256 "5d200339561b2999d496d51b40d53fe4c920db5070c25c4eed8a8d61bc2aaf5a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-024746-0dd0d53/marvel-linux-arm64"
    sha256 "f0b90463d1cf666203844529abdb275ecb95551122368dd08f3d767e6c607ad6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-024746-0dd0d53/marvel-linux-amd64"
    sha256 "64e72faeab0c7329b52ffae2211b62b24d6c3366c0f4e7cecb49feee2807c4bb"
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
