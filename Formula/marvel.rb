class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.052456.561226f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-052456-561226f/marvel-darwin-arm64"
    sha256 "2055550e7addea901fed70b380be4b7a2e85f3a61e5e6a363d52d51cb2f007d7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-052456-561226f/marvel-darwin-amd64"
    sha256 "4f4851858fd972e03478aab1b5e9d2c304e90969a5667a3918ac7caaab8fe0eb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-052456-561226f/marvel-linux-arm64"
    sha256 "0c5666873522300fd9e1141845131ad8c2de29f0b1cb830fc38d5d81904efbe9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-052456-561226f/marvel-linux-amd64"
    sha256 "3c676ed879203dc25bc9854527232028d0ecf166c35cad6bd1568d3c847f2970"
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
