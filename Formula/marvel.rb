class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260415.213637.70b9255"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260415-213637-70b9255/marvel-darwin-arm64"
    sha256 "c1cf4bda77933de66edcb42a0578c49d12fcd4896c4f4cee74f93d416af00896"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260415-213637-70b9255/marvel-darwin-amd64"
    sha256 "38d671af47fc811fa4258cbe26d2518403523633fa3dd263b6569cc97a9c8e00"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260415-213637-70b9255/marvel-linux-amd64"
    sha256 "984f97f092da2aaf830074155c4779eca21a527e83850149df0a473823c487fe"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
