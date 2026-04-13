class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260413.061154.d217f9b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-061154-d217f9b/marvel-darwin-arm64"
    sha256 "e9150e6cd26d2219006680a3d0567e5e5caa6174937424e7db4a0c57b538e15b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-061154-d217f9b/marvel-darwin-amd64"
    sha256 "978af84a95cb7704db5fa3b215b293c4fd28e380322f483def6b0c47a13f26ba"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-061154-d217f9b/marvel-linux-amd64"
    sha256 "5b6c49358c33bff009d9482fe164d33360179a689a83960a338174766d26d73c"
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
