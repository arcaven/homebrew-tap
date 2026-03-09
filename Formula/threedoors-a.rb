class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.d6ae965"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d6ae965/threedoors-a-darwin-arm64"
    sha256 "aec19e22e9018d8f06844d5fcbbac10cbb281faeb660a09fa739989c8e75e584"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d6ae965/threedoors-a-darwin-amd64"
    sha256 "1c859afd60d33107ec9eaebb4e427c05994b9127adac66b8d1e7ba6d3347ff75"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d6ae965/threedoors-a-linux-amd64"
    sha256 "51fccc19d63438855b11f3e6fe167370a77420888be094fe72a847405f231b14"
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
