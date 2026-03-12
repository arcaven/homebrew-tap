class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.142442.50d8b59"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-142442-50d8b59/threedoors-a-darwin-arm64"
    sha256 "a802c312499d02c0b8eeade9b5a9e536e533fdef322830b648bda80c660fe4e3"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-142442-50d8b59/threedoors-a-darwin-amd64"
    sha256 "f5072923b5a08502786d0f0328251b0dc3b4e6771c20e034d33e0eea5d34ba77"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-142442-50d8b59/threedoors-a-linux-amd64"
    sha256 "5be72c6895acbcef477f84526e9ab604696310a84010214f819462595aee6404"
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
