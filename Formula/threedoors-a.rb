class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.58795ec"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-58795ec/threedoors-a-darwin-arm64"
    sha256 "e4268c8e239cfaf4da406a5916ac3f916a00c2509f72fe35b2230913c8807b1f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-58795ec/threedoors-a-darwin-amd64"
    sha256 "106499e530b9cf1d42e12c0416e301dfb4511123af2232ec5d9f80cf80f32dde"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-58795ec/threedoors-a-linux-amd64"
    sha256 "5d3c07d025f94627ce09e353971aa36d4bdf927ead1a430a74f0441e70cbf066"
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
