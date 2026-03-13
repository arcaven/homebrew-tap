class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.222517.2af7876"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222517-2af7876/threedoors-a-darwin-arm64"
    sha256 "92dac7db3ac294933f9ba4be5df3d024abe311ba766457abbdad6e80b322aeb5"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222517-2af7876/threedoors-a-darwin-amd64"
    sha256 "9e4f9827fef694b7b019d35fa15f94743fa354f57a4d94efd0d6f8c7f002757d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222517-2af7876/threedoors-a-linux-amd64"
    sha256 "67d8b8a669d49261a6dd5599031057e7a79f81f2dca9cc66e358c89ed4d3f18e"
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
