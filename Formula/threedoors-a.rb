class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.024757.adb7d6f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-024757-adb7d6f/threedoors-a-darwin-arm64"
    sha256 "75a2b83e8116ef37608a3e073963d96e5ed4c356a5907131b325481e50b06e97"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-024757-adb7d6f/threedoors-a-darwin-amd64"
    sha256 "07e31906ab52e3ec8866de747aa792e9176b19158a4441e246c50d4c86352e53"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-024757-adb7d6f/threedoors-a-linux-amd64"
    sha256 "572522058c6d9327ab2905473ca101b63f070d172228fb4b89fe39b8031bee71"
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
