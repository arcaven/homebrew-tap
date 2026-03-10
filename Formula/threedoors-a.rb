class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.667c475"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-667c475/threedoors-a-darwin-arm64"
    sha256 "f7d372a6e77ddff0f3922dc36a1a7072f3b6ea4c057cadef0d5fd507190fae8a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-667c475/threedoors-a-darwin-amd64"
    sha256 "6105bbbb530ea5a7eeb4d9a39f36251d284d7b65bc9ea54efc9ac44bd430b6cc"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-667c475/threedoors-a-linux-amd64"
    sha256 "e657d49d228963f398b627361b0bf6a17f817007ce2a55ebaaa97a8741107198"
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
