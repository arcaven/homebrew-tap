class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.195446.14b076d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-195446-14b076d/threedoors-a-darwin-arm64"
    sha256 "bf91744b3c4a2254bb3f6107b9a5ee19df0611fa8aeae7df55a57a3f7661ea7c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-195446-14b076d/threedoors-a-darwin-amd64"
    sha256 "08bc3368077214bfdbd2bcc7e62b878ada1d75ce68c4a84c69a6066ab9d79750"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-195446-14b076d/threedoors-a-linux-amd64"
    sha256 "624d92c32fc0f9fe624c5ac4f98a9121b194d5cf99693786e460a9f3d8e998dd"
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
