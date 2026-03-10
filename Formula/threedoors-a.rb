class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.59bbc42"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-59bbc42/threedoors-a-darwin-arm64"
    sha256 "a4ff677d349cbeebf81e7ba3bee94d23f983a1a38d449b23a4547f5a018ca0d2"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-59bbc42/threedoors-a-darwin-amd64"
    sha256 "add1827a2e017adea02bf3fa43204e2f4e8f980f7be55617102c105861fad015"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-59bbc42/threedoors-a-linux-amd64"
    sha256 "80f81b44721e6208513291c593f01fb70f233c446e51620ead3fda6dcd30e56f"
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
