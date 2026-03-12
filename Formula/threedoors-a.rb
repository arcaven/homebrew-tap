class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.012733.4f55bcd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-012733-4f55bcd/threedoors-a-darwin-arm64"
    sha256 "8d4e5d5667c5da3ecd42c4a31a39600fe7811b666c878d6d178521769e6a5fae"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-012733-4f55bcd/threedoors-a-darwin-amd64"
    sha256 "b87ea70eb073bb2a04a6e5dfb3399557f97865a514fe76c6d1ad47d3c144f192"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-012733-4f55bcd/threedoors-a-linux-amd64"
    sha256 "1fcdb6730f99b76456fd1b33dbed261fb00998e224e03d77ac7af7649195e817"
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
