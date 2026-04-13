class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260413.063746.30d8706"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-063746-30d8706/marvel-darwin-arm64"
    sha256 "2d17bc9d8e92547cc339208963046e67ae15aa438d919da8d9511b5b42da1bc0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-063746-30d8706/marvel-darwin-amd64"
    sha256 "718f6b30343014be783bda4f78461d1f7f6e22e9185c821f210c1cb58b8afea4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260413-063746-30d8706/marvel-linux-amd64"
    sha256 "881c7c870a0479aee7e8c83f9e8edba3fc9c612d190ac472ec74bcc956da85c9"
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
