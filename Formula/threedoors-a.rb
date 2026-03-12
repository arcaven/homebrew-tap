class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.034726.dc5ab9d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-034726-dc5ab9d/threedoors-a-darwin-arm64"
    sha256 "2aa1621ae562d80251e3cf6d0e9c529f7d72f7c66757d10fdeb3cb691d731984"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-034726-dc5ab9d/threedoors-a-darwin-amd64"
    sha256 "70c7eba4f1faa8c5d3135a0dab6557e5e85358abd660f856dd2b60aa1af05af8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-034726-dc5ab9d/threedoors-a-linux-amd64"
    sha256 "344c8d816282af65c1f5e6d5390e5b199dbe056c6ab983dac56120af0b0252c4"
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
