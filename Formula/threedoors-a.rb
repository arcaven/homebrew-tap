class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.231613.636fced"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-231613-636fced/threedoors-a-darwin-arm64"
    sha256 "3b19dc3a87c2cecf25a09b75acc5f59b65eec55b4614fe842b96c9d50635844b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-231613-636fced/threedoors-a-darwin-amd64"
    sha256 "7aaaf41dab4dd93103af0ceeedda783c8e2f511673226143f48882faaa54fbc9"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-231613-636fced/threedoors-a-linux-amd64"
    sha256 "d6d7d2f6676698c17c25aaa8966f81f4fd2938903be9b310b27ddc452d131fbb"
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
