class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.162844.0f49528"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-162844-0f49528/threedoors-a-darwin-arm64"
    sha256 "21790e6d1c4eafdb4c50d60f0dec4f3a08ac310f8d8484c43731ecb8840dbb87"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-162844-0f49528/threedoors-a-darwin-amd64"
    sha256 "d63d6130bc21c6265b688b739e640de09aa80351640a7229b3cd6c2dc7fb4516"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-162844-0f49528/threedoors-a-linux-amd64"
    sha256 "3cfb1156a033ffa8038711142502cc8431614141df40818e0acfd546ee6f1243"
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
