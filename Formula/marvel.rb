class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260506.201229.1e9fd2b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260506-201229-1e9fd2b/marvel-darwin-arm64"
    sha256 "0cd135b0b59834a3dfb883e3bf371b942329d6ec5b1e1479181e258eee794f68"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260506-201229-1e9fd2b/marvel-darwin-amd64"
    sha256 "b4139c360fbded4266da8b88bb242f5abca7d127b842f08c82c3f380d8692b93"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260506-201229-1e9fd2b/marvel-linux-arm64"
    sha256 "e991d6f8230e6ba936b9ce3c2de1eb2defb86844e2107e171a0074446635122f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260506-201229-1e9fd2b/marvel-linux-amd64"
    sha256 "97417464a85d3d8ee5efedc94583f173ad15536e606c05c761bd513fad0a35bf"
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
