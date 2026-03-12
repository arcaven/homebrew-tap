class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.023616.474f2ba"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-023616-474f2ba/threedoors-a-darwin-arm64"
    sha256 "840d3b772a55c8a5612e95a09cb56575e905135436ada566efe696a106978de7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-023616-474f2ba/threedoors-a-darwin-amd64"
    sha256 "2e52f74a250d93337a63f07c1ae0d9094b77ed879c62bff84db547a941f5a2f1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-023616-474f2ba/threedoors-a-linux-amd64"
    sha256 "4a1b97dde0a07467b9b76178e23bdf8b70d3e8756f9a1692812d38532dc88497"
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
