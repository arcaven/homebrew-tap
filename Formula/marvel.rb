class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260419.034656.8f542ca"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-034656-8f542ca/marvel-darwin-arm64"
    sha256 "14a9683af1541ec9c865beb0f37c3ff872e93d4c970baa0373de9fcf8b5c18b0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-034656-8f542ca/marvel-darwin-amd64"
    sha256 "10d5fc24e6695f2a15d02f052de704b314b1eb96f50e90ae63c388419fe339ce"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-034656-8f542ca/marvel-linux-arm64"
    sha256 "8efca2da94ea2eac4062002edb4e73cb7699e4b8485c71443b6f8a09efea9844"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-034656-8f542ca/marvel-linux-amd64"
    sha256 "4a5c2a30e015854f5008a1de20d87845d23374575c9f749df42f746936a89970"
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
