class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.200913.d79bb8e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-200913-d79bb8e/threedoors-a-darwin-arm64"
    sha256 "d4090fa8606a191db1da7ffaa81affae0e5403e208130ffa6dd75afdda3ad7ee"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-200913-d79bb8e/threedoors-a-darwin-amd64"
    sha256 "0a3cbc0f56d3dd8143ee4790285fb3a68767802aa8a7b1f6ade5a59133deacef"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-200913-d79bb8e/threedoors-a-linux-amd64"
    sha256 "a9808201c8552558c7ddb98b4555bedadef21fe16312b231087d36cdba124be0"
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
