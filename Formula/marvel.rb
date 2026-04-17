class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.051601.892631f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-051601-892631f/marvel-darwin-arm64"
    sha256 "9defe2fe75a94df5b3c9d452f04aaca1230b7498a6ce08df0b89fe60829692cb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-051601-892631f/marvel-darwin-amd64"
    sha256 "c896266c81bc2e946c8e80fa9f791260384ac28dc1608aa09ea418ee6d732c70"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-051601-892631f/marvel-linux-arm64"
    sha256 "7dffc6cfa0add28adfaf16871df3c5b0c26e10970fd0cbdaa50b9d4f1e62f880"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-051601-892631f/marvel-linux-amd64"
    sha256 "4e7135a139aa6e026ef7123bf72c961ff07510f11bb47583c937539086e511cb"
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
