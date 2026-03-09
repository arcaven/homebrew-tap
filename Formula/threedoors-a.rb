class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.49b375f"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-49b375f/threedoors-a-darwin-arm64"
    sha256 "449c8d658c7a6373c97b4dd7fe09ddaee35ecbe3f9d8ba9a3a43d32523c723f3"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-49b375f/threedoors-a-darwin-amd64"
    sha256 "a91f209e88de4c735f8de0ff50289b0f4490329f10ae48ea1cdeea2e3d32dc1d"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-49b375f/threedoors-a-linux-amd64"
    sha256 "a58b194f53e8a87a2f5953e9c2eb9cb7e028aae12e21bc34310dda8a882d91e0"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
