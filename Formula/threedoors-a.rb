class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.233209.f47792c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-233209-f47792c/threedoors-a-darwin-arm64"
    sha256 "5df2d4c3b578be1def5eeb2f7fc63eefea929b3a2b2ab9b3a0968593d4d05121"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-233209-f47792c/threedoors-a-darwin-amd64"
    sha256 "94c7eabc5e31179cd771cb57298fc530dcce5df6415aa31cb64b4101ed722264"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-233209-f47792c/threedoors-a-linux-amd64"
    sha256 "ed57ce868ffe9e962542e84a32a5a023b12e03e163f4afb1fd7205ef6aa73e98"
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
