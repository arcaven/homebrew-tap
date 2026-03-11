class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.bd4e285"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-bd4e285/threedoors-a-darwin-arm64"
    sha256 "84f734e0f289d238e66b4fa40e9c87288af3f25bb559e6185f4004235ceccb8b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-bd4e285/threedoors-a-darwin-amd64"
    sha256 "e05a26a8386d11dfb38f4da6099a5c435d1cb6bbb575e08d9d832fa40be1d6f8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-bd4e285/threedoors-a-linux-amd64"
    sha256 "6ad08233887efcc1023acb989697e2b1d4aa2f2015f7af89898c665b918c2888"
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
