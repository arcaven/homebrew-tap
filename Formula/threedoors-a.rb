class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.232801.e20f933"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-232801-e20f933/threedoors-a-darwin-arm64"
    sha256 "1f3d697d4439c0848840c368d37bffdea4d6d470b9c6e39118a08c6ed7569448"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-232801-e20f933/threedoors-a-darwin-amd64"
    sha256 "c1a6bee45798657840734e2a4a27b87cb6b9375ed3f6b3b4b767bb1ff2301185"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-232801-e20f933/threedoors-a-linux-amd64"
    sha256 "a890f87822898bb8ab45441c575cf1665b7933f5116f10200ddc522581713352"
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
