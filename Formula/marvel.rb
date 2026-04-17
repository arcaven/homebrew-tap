class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.204314.9867b78"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204314-9867b78/marvel-darwin-arm64"
    sha256 "d037196488cae1c6d51272857cf2510a2168832d243e3823e7bb3a056979a8a0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204314-9867b78/marvel-darwin-amd64"
    sha256 "f9c187b2cf4d44299a0bc6b6356439b9579b4e398a01b0f78ebb8ab3b25e6ebb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204314-9867b78/marvel-linux-arm64"
    sha256 "1305efcae4e931e1c76c3ae3f5365f6bc64b7c9fa8c3278c8e60f4e34aa27cd8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204314-9867b78/marvel-linux-amd64"
    sha256 "9ead28cef5cee99ebcf892ea48f82290b3be42a9df0c0183ba13667b4c3b8724"
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
