class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.b5a73a8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b5a73a8/threedoors-a-darwin-arm64"
    sha256 "87f5706badd05bcd6491c9a8516e2714a50d59bb030890149144db203717fd8c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b5a73a8/threedoors-a-darwin-amd64"
    sha256 "564c8bb1fd61432b71f36b7390e366eaf757948a78267550ee670d5f84414607"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-b5a73a8/threedoors-a-linux-amd64"
    sha256 "744d19dc721a7f32772bd9adf25a8d213221a1b59523f876430b3f2d5d38e003"
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
