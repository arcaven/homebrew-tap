class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.205225.1beed32"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205225-1beed32/threedoors-a-darwin-arm64"
    sha256 "dad24e078b012ab3035a14c430e90276b3392dc9a69d1ef2c5de3ba1af541476"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205225-1beed32/threedoors-a-darwin-amd64"
    sha256 "8aa675892036b8fda1c6e42f91a43901fca0dfbb100eb63fea41178a0a6bc553"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205225-1beed32/threedoors-a-linux-amd64"
    sha256 "8b6ed59bc381bddf74580e3762499b9ffab975fc1c05b69663560cb66af7154f"
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
