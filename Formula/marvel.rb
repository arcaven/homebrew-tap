class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260419.052959.c6fdb4f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-052959-c6fdb4f/marvel-darwin-arm64"
    sha256 "60bd89db0a40e71e13bdbe47e4ec088e88c2b299c8416a332549b9962b5f79ad"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-052959-c6fdb4f/marvel-darwin-amd64"
    sha256 "48e5ce5405363ab109270f02d953664a08d572947d2a6a164eae7596bcc47470"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-052959-c6fdb4f/marvel-linux-arm64"
    sha256 "18a2eadb6753842e2b1bfd641607c287cdb253b35c8634709acb48db539673a3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-052959-c6fdb4f/marvel-linux-amd64"
    sha256 "7a4702efaf2c7a7de765dd35f508ba7d8273b08b57f54c09f688502caeef7b0b"
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
