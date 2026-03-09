class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.5128ae6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5128ae6/threedoors-a-darwin-arm64"
    sha256 "52ddc80f4346d205cc2cb597212505f8c6f53fe17757a6c2a33580513ef8a36a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5128ae6/threedoors-a-darwin-amd64"
    sha256 "cb92457bf9c25f8b4eafbc3aa91237cdf9dfc461662a0f590f270a7da6055d0f"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5128ae6/threedoors-a-linux-amd64"
    sha256 "0e418fe6bfbd9c7a50777e8841fe6b9810cb955268069354c65578e93f242667"
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
