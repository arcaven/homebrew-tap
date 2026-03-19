class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260319.021014.01c25a6"
  license "MIT"

  if OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-021014-01c25a6/threedoors-a-darwin-arm64"
    sha256 "2321854e39d0de1047fbbd4b904d6c2b372f14587924705b87a203bc842a2bab"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-021014-01c25a6/threedoors-a-linux-amd64"
    sha256 "ab3682e52cd978e434e9635c105fd9969f485a1f570b3d8eae6e2483272e9f3c"
  end

  def install
    if OS.mac?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
