class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.0f0a13d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0f0a13d/threedoors-a-darwin-arm64"
    sha256 "1baf4700eaa49bbb1e4fd73626727a55eb76e4298befa91d54a59a1666a9dc29"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0f0a13d/threedoors-a-darwin-amd64"
    sha256 "1cb2dad60718c370742d60a0d151f99fc74a4653641037f9d287d5614449fbc7"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-0f0a13d/threedoors-a-linux-amd64"
    sha256 "4b16d977ea163acb44133d8ddef5a129b8d75dd0c0655e0c7ae24d407507256a"
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
