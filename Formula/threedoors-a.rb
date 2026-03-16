class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.022040.62ab0d2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-022040-62ab0d2/threedoors-a-darwin-arm64"
    sha256 "2713d959ff8b341548ab480886d07fe28ff95f882f579dc17be73d34afcc4c47"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-022040-62ab0d2/threedoors-a-darwin-amd64"
    sha256 "76cb7083dca9b984dee3e4a70342bbce8796c054a6a7a19cb665311655e91129"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-022040-62ab0d2/threedoors-a-linux-amd64"
    sha256 "716ce4391921d72d25ebc8b0d9398f6dce6f04ac1599f4b36e93ebea5e04a12e"
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
