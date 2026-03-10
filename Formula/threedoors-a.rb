class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.496fb30"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-496fb30/threedoors-a-darwin-arm64"
    sha256 "645f4c0e72b4b4ee72bc7903a9eb1186534cd5367d30630c89f7807d85f88d88"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-496fb30/threedoors-a-darwin-amd64"
    sha256 "c4fd0bbd05ac713fa208701714b2946d5593581be468d9b6bd42b1437a797b3f"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-496fb30/threedoors-a-linux-amd64"
    sha256 "cceed119323297876b13efc0bd906738a21262ba1641b02d7c97c8cbc6db93d2"
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
