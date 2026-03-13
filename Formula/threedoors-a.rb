class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.200744.ad89a26"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200744-ad89a26/threedoors-a-darwin-arm64"
    sha256 "b242f44f3aafb586487f8fdf55354439bb08917aa59be636d24e85f86c0f7275"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200744-ad89a26/threedoors-a-darwin-amd64"
    sha256 "642aaf48c7356b2a706e22052d84edcb0073cdad151b6fe1dd44d573b600a7b5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200744-ad89a26/threedoors-a-linux-amd64"
    sha256 "178c764a7e8e763c32276d6fafeb46e023681113fab9bd9b59d49dc7e9774c6b"
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
