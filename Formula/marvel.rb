class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260419.064016.1d26f05"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-064016-1d26f05/marvel-darwin-arm64"
    sha256 "97d029584577a20c5a649fcaf6e42126251e95d74ea66fa6f883abeca4211b62"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-064016-1d26f05/marvel-darwin-amd64"
    sha256 "03c4bbd83ff71ece403e636c5556303851ea292e0cdf2d75d5bd9c42eb8c5ec0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-064016-1d26f05/marvel-linux-arm64"
    sha256 "e505ec0ad8439a093ac6408d9efc66e967607953bc1394313f546f56ffed5b7a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-064016-1d26f05/marvel-linux-amd64"
    sha256 "1dd4f860a65a5d381d7c556c550aef7dcbd315557beaa54e35ba1dd6491d3143"
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
