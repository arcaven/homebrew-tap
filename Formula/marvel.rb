class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260422.145350.4b84cfc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260422-145350-4b84cfc/marvel-darwin-arm64"
    sha256 "259f438eb4baa3a2962c24e623518021d17a81c4447132f900c20ccee6d4f24f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260422-145350-4b84cfc/marvel-darwin-amd64"
    sha256 "033cefcb70f75a1dd562954ddc5c06fb9975c360d9c2dda7470115bd98898e99"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260422-145350-4b84cfc/marvel-linux-arm64"
    sha256 "ed260ee89ab25780dbf7fd2ec9744c6df6c0523de9717676d7611691aa84d5ae"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260422-145350-4b84cfc/marvel-linux-amd64"
    sha256 "4bdd0d75627fb15ad68b92b8d81d761b9cca072efd27cc0fce1fa1bd908656c5"
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
