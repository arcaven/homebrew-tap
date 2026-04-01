class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260401.033447.a566b4d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-033447-a566b4d/threedoors-a-darwin-arm64"
    sha256 "8010657a054da27fb4052a1d76351343a4bf1d825560718cc0ecb459b6f9ae5a"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-033447-a566b4d/threedoors-a-darwin-amd64"
    sha256 "55b0db12ebce10382c81c94fdae61ca3d4e37e701c315c6e8aa0a76f871952e9"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-033447-a566b4d/threedoors-a-linux-amd64"
    sha256 "2cfa2651fca7d9ea5056090df5fe0e55168e4d8582be13c89ab845b03eef5f17"
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
