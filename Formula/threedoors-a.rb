class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260404.153727.79860e0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260404-153727-79860e0/threedoors-a-darwin-arm64"
    sha256 "78531fdf102e61cf62e69c12fa7bb67f20201d9c90a9b8c84fce234d72f23997"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260404-153727-79860e0/threedoors-a-darwin-amd64"
    sha256 "e0469d94d3fdc3f21c52e221315a0419de4703cf885cef7315d8268ad383f17b"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260404-153727-79860e0/threedoors-a-linux-amd64"
    sha256 "bfc96c13bc6384373838993649fd33cb373fc818af0c5fa6764c925b24d3ff2d"
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
