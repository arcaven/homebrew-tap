class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260405.062910.fbf1891"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-062910-fbf1891/threedoors-a-darwin-arm64"
    sha256 "9d702d0f262ec00f8b05ba3c4d29b3e6bd02fac51ec0ed853673209793f7682b"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-062910-fbf1891/threedoors-a-darwin-amd64"
    sha256 "5e7dcaf1135de4cc9013eaf5e6c64251fc9bb93fc7f6f3fc7df6c57a5af9e69a"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-062910-fbf1891/threedoors-a-linux-amd64"
    sha256 "8db722db3e92005f4c66db5aed0a39860bd4f6fc338208b4cae78567a36d075a"
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
