class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.064009.24bf5fc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064009-24bf5fc/threedoors-a-darwin-arm64"
    sha256 "b398e462b8a56094199ae3814ebcb0539c492c23946d6eb0d3f0b532d7283348"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064009-24bf5fc/threedoors-a-darwin-amd64"
    sha256 "9d0ad8f5fd48906e044ab76d232d77aa2904000852cea004d5d98e21bd1e298c"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064009-24bf5fc/threedoors-a-linux-amd64"
    sha256 "e73eeb92b3459c65a8c9a6c39fb9397fe49123cabd35e343052793c309926e98"
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
