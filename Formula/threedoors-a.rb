class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.222349.10c4c62"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-222349-10c4c62/threedoors-a-darwin-arm64"
    sha256 "18178803df737f2f02b20347f2d54f28a531eb14c4b2f7fee4d6e94298120809"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-222349-10c4c62/threedoors-a-darwin-amd64"
    sha256 "effb2eee1bfcd5b4671620557ef569922d8faa7fa303da694052ca51a22e8ddd"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-222349-10c4c62/threedoors-a-linux-amd64"
    sha256 "0388fb47bf004711c7c3c16bfe4ed6025f382a28c38aac1214f59af762964abd"
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
