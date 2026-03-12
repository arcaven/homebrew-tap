class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.004656.070b6cf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-004656-070b6cf/threedoors-a-darwin-arm64"
    sha256 "2ce8484f85a9fa9f10c15d6dd08d3152065a24caa45cef3014bbce1143f31557"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-004656-070b6cf/threedoors-a-darwin-amd64"
    sha256 "bbb0b39dac32dd0ab28b902823bc73099761f6c761355588828033d9114bc42e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-004656-070b6cf/threedoors-a-linux-amd64"
    sha256 "f6a61fe919136ba2fc9c26b3122413bd57ee81d1d5a994f39a17f4b01d9b0dcc"
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
