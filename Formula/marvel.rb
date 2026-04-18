class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260418.013111.81a00b2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-013111-81a00b2/marvel-darwin-arm64"
    sha256 "94e243acf3ad2f0f8b13d29ed31a6983873a0e1f72f569b31f8826b2ee9dc813"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-013111-81a00b2/marvel-darwin-amd64"
    sha256 "f55ca9fe081e81218fdf254e1ebba756bf045b408bf47505be104b0d499924dd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-013111-81a00b2/marvel-linux-arm64"
    sha256 "357aed9ff22518e9932208b0f50983eef5a437d96fa0d60f9b5ba2ef3294bb5c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-013111-81a00b2/marvel-linux-amd64"
    sha256 "07389372985c1134f73f30a8625bbf0bf5cd5c3c80f4fa532f92c1d069f7428f"
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
