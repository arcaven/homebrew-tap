class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.195848.5d8e584"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-195848-5d8e584/threedoors-a-darwin-arm64"
    sha256 "a563627d79a07f07ebb5026eba23246d4a08207ac6e9766493486d25d38e34f5"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-195848-5d8e584/threedoors-a-darwin-amd64"
    sha256 "b853f26c54e32eedd936f7a35d12e4093e10816d4ac41c092dc7c6b11738956a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-195848-5d8e584/threedoors-a-linux-amd64"
    sha256 "a177abced71a072e3b9b10013053fb14d8aef09e1f4439ee8cf691e565be0a66"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
