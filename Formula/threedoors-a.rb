class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.42726a3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-42726a3/threedoors-a-darwin-arm64"
    sha256 "9d46596aa0f4d42f38aca75e7fce2238b356b85a738fde10fef1a04fef3df89d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-42726a3/threedoors-a-darwin-amd64"
    sha256 "960305211ee5f337fca7c6441202ea56e5c32e9e1f350dfd1158e33b2f67e880"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-42726a3/threedoors-a-linux-amd64"
    sha256 "81c083c3f0e8e87e4ae6acc8b1f57d46e490f4cd40c362c47983fcd84376341a"
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
