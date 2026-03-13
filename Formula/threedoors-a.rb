class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.211809.c15d77e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-211809-c15d77e/threedoors-a-darwin-arm64"
    sha256 "6bc4e605aedeb1a7876aa2e22a1c19accc0c594c9adbf8650bf26695df12528f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-211809-c15d77e/threedoors-a-darwin-amd64"
    sha256 "dc6d7c3fd587ecdd1141fdc109c094406aaa869db724886a441513fe850a7b36"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-211809-c15d77e/threedoors-a-linux-amd64"
    sha256 "0c33a475e159aef4b7d0014607c094eea7fe2692376926402ca76737e38a3b67"
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
