class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.a41948d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a41948d/threedoors-a-darwin-arm64"
    sha256 "4dee0c0bb60156f6837a1202b9170cadcaf6067a063ee628137cb651f16687b9"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a41948d/threedoors-a-darwin-amd64"
    sha256 "d0956e0902b975ab5736f67c523f6594852c7753fb2ec97e4fbf5578876d80f9"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a41948d/threedoors-a-linux-amd64"
    sha256 "ef191ec48e6dec4ac0027f31c9fcd7a98d861d73e309845ba94ba0d81cbe1e7f"
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
