class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.011130.2bf53b3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-011130-2bf53b3/threedoors-a-darwin-arm64"
    sha256 "8e1244caba50df1b2b5b099aa70b7ece571a6f48ea8c9a5562a3fefad16e37fb"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-011130-2bf53b3/threedoors-a-darwin-amd64"
    sha256 "8915a82c959e6393c07b38254d48e36604439032b1f92481d5304d16fa97904f"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-011130-2bf53b3/threedoors-a-linux-amd64"
    sha256 "6f8d54fcd0688817108358cd921710177b3b1ae83209e2a984a11870fe4f409a"
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
