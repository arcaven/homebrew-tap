class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260404.164559.baf1b50"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260404-164559-baf1b50/threedoors-a-darwin-arm64"
    sha256 "cf129db9a214e735b241defe93ad2d734d607c595a2fc0dd228c28c70ebd588e"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260404-164559-baf1b50/threedoors-a-darwin-amd64"
    sha256 "9d118791850269b52c02b7bfa56f6011dc074a22fb6ea0bb0509e12536a6c694"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260404-164559-baf1b50/threedoors-a-linux-amd64"
    sha256 "020750c2efb1fb4d9358d8a06c8be787b9082a838736e8eb04f0419e326bb6e0"
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
