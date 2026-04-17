class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.203830.862c9f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-203830-862c9f7/marvel-darwin-arm64"
    sha256 "463adbe85c43eaf33b21eb23a5cd2c3f680d82e5937babec026bc5b7d1904fc7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-203830-862c9f7/marvel-darwin-amd64"
    sha256 "98370711307e14b15c011c6b633f06cc6f39d2d7277d58fb79c5c9ac0d7fd63f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-203830-862c9f7/marvel-linux-arm64"
    sha256 "c0cda1b5b42234c8a455b82c2fcbefdd2759de51491361c8db73829e99e2aceb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-203830-862c9f7/marvel-linux-amd64"
    sha256 "3281ed26d79b7f7e01907e262e9f71219e837293a4d3375911892e8ad5445e85"
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
