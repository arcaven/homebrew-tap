class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260416.021858.ac86dcc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260416-021858-ac86dcc/marvel-darwin-arm64"
    sha256 "811d72e5bd67bcd2513f2760aa9ed0864eab423597bb2d2bcb3a977405216720"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260416-021858-ac86dcc/marvel-darwin-amd64"
    sha256 "0a55922b94a0c09acb0ce2e4605a56b7cb7852358d58388701c2eb146bbd8046"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260416-021858-ac86dcc/marvel-linux-amd64"
    sha256 "e37744cd524bb5e618078d67acf08ac0a1de891de3b60bf691da8baa8611766d"
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
