class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.5a4e2cf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-5a4e2cf/threedoors-a-darwin-arm64"
    sha256 "b93d684e337aac39e58f3d89f02b8f5a5f866ac908b49ee63f433afb4e887342"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-5a4e2cf/threedoors-a-darwin-amd64"
    sha256 "73a62cf3edd667aed0d8b5a23a212783a4ac2ff89bcdd03055440e47ca614b02"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-5a4e2cf/threedoors-a-linux-amd64"
    sha256 "c8f59a5122285076b116b588569d4ad5de7be9e5237eda64227efe44484122be"
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
