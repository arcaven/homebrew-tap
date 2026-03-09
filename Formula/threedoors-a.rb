class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.832a4be"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-832a4be/threedoors-a-darwin-arm64"
    sha256 "fa0f32f639cc5b9b320a688881316852f0d40616faa50c458ab24bad0b700e52"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-832a4be/threedoors-a-darwin-amd64"
    sha256 "2d718ce035febdf877094cefcbbfc237a8ec566e46b9bd46e8759f954bbbf704"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-832a4be/threedoors-a-linux-amd64"
    sha256 "6d288c4984cff06ca0578cd96bd88935d944f183119b6bd27d7bc54f933a781d"
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
