class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260405.064913.841e40f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-064913-841e40f/threedoors-a-darwin-arm64"
    sha256 "154f82584b079b3a5d8b56f055dda89689bef9ed93de1a49944a9b1d611839b0"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-064913-841e40f/threedoors-a-darwin-amd64"
    sha256 "407e59297c6954d3e9832b6805891362dac5c0485bd6db8b75906716f8b2c84f"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-064913-841e40f/threedoors-a-linux-amd64"
    sha256 "2a362d3eba2db5642f6009e0698deeef7148467e345b64132e78ac081310e23b"
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
