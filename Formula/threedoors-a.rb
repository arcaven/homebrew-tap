class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.7c96ac3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7c96ac3/threedoors-a-darwin-arm64"
    sha256 "e7c3954e6f70a4d62f751c9b81f08615f349a6f7179e52cc3d80e1c64427d38f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7c96ac3/threedoors-a-darwin-amd64"
    sha256 "c8861cb1cf8604926f43ea8594122e8e67530b8b9bc5460f677774ad05f7e880"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7c96ac3/threedoors-a-linux-amd64"
    sha256 "57bdb91fbbd94e6158a4762434098e984a0bf39db0a5441b945a964e8e2914aa"
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
