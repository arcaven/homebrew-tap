class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.e87b0e8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e87b0e8/threedoors-a-darwin-arm64"
    sha256 "3e90f0b5307c9ad802a73b1f1d652caa57c942e43a668b53652085a351ca38bc"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e87b0e8/threedoors-a-darwin-amd64"
    sha256 "a2a3155f8e0c7700c2bcea61e3d44b86021df70921d493981fd9c477fc3fe6b8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e87b0e8/threedoors-a-linux-amd64"
    sha256 "7480b57b60c57208f10ba00474f8beeead51e3e2f3dd8c6e282a47cd474f9259"
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
