class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.53b6514"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-53b6514/threedoors-a-darwin-arm64"
    sha256 "9ecbd79a69ace61b88e6aa944c0f1c6c35efafdf545c4208dc5c002b758b44ec"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-53b6514/threedoors-a-darwin-amd64"
    sha256 "ee790e9d30ca8da032769fd40d0533744fcafb0b9c24cd7cebec0ff605a8250b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-53b6514/threedoors-a-linux-amd64"
    sha256 "ec1eab6b92a3c3e3272e648149ee061685bf5e37e8972b47916e9dcbaf26bd9e"
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
