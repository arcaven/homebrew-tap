class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.001006.9606e8e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-001006-9606e8e/threedoors-a-darwin-arm64"
    sha256 "723421cfec5989b0a44efa891d166163259998888be5f961a512917ffb86c1e9"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-001006-9606e8e/threedoors-a-darwin-amd64"
    sha256 "d217d108297424c8508efaaa88f04b665e5a1ee1bd463b606109211258ea749f"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-001006-9606e8e/threedoors-a-linux-amd64"
    sha256 "0936b34e196960472e67fb8e090414c5ff8f4d67b64ffa02e3a5189ccbbb27c1"
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
