class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260513.223449.489ab83"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-223449-489ab83/marvel-darwin-arm64"
    sha256 "fd147172f7c2ec68c38d7e7c05666df6d1da5abd363a4f2aae597510b165b2ac"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-223449-489ab83/marvel-darwin-amd64"
    sha256 "316a6f48a2701080312ae7a769793643d33f7b8bf885d07d021f2100d9653f13"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-223449-489ab83/marvel-linux-arm64"
    sha256 "a806e9777837cefc2bf1484f674af22ad63ddafa32c9e75514f9850791e5fed3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-223449-489ab83/marvel-linux-amd64"
    sha256 "5a3a01600434c7f2a9279bf930dad9fb94d532b3f3b9ef85262991d2192b10cb"
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
