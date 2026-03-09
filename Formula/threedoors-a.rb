class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.e75f228"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e75f228/threedoors-a-darwin-arm64"
    sha256 "ce7b101788919589348aeafdc13d8579257a9ab6edcecf56df855e4e1724bcef"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e75f228/threedoors-a-darwin-amd64"
    sha256 "063948c9394201151f7fee1b4b4ffe242c4905073ae8c2a407fbc7a35767253a"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e75f228/threedoors-a-linux-amd64"
    sha256 "c87e0d5bc554caa4dd6efd468a34c20e8bf5a57e2eb3ec1936c036aa3c1caf52"
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
