class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.221857.646f3ef"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-221857-646f3ef/threedoors-a-darwin-arm64"
    sha256 "2d5e55d9db47c926d55f5a92a58696dc638df2978d010109043c1061e0be00bf"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-221857-646f3ef/threedoors-a-darwin-amd64"
    sha256 "be025b417df4c5047de8b78fab67c34d2f03871f71327bc9e9c3f85171f78eb2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-221857-646f3ef/threedoors-a-linux-amd64"
    sha256 "25e750ada3880f7abb576d77b48a08862f91919e2f88c252b283273bb4c5693f"
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
