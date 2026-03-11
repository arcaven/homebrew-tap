class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.12069ee"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-12069ee/threedoors-a-darwin-arm64"
    sha256 "8635b2484ab60f49d2debaf3836890efd498c5836d04cf9303f23229033ac8d3"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-12069ee/threedoors-a-darwin-amd64"
    sha256 "121389cdf3310d6ecaef292894503882fe3a0bb52b0378a7dd6b778f942086b3"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-12069ee/threedoors-a-linux-amd64"
    sha256 "e8984cfdb1ae5a7e0792ea5d8209ec0cb62ca3b06d3bbb227b4b91096c2a0679"
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
