class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.183115.1b9ee3c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-183115-1b9ee3c/threedoors-a-darwin-arm64"
    sha256 "d6c616b0468d8835fc670ab42a35a747c772541f05b1be1c320c54d609781b44"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-183115-1b9ee3c/threedoors-a-darwin-amd64"
    sha256 "8d684d2648215e25057536a8a8b3b931bc05d187e2f47761ff97e7234f51e28b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-183115-1b9ee3c/threedoors-a-linux-amd64"
    sha256 "b1e2798bbc602cba2ffd730762e1c4aa75e45cf7effa9d547c25302f09b082f4"
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
