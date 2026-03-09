class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.ef9fd62"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-ef9fd62/threedoors-a-darwin-arm64"
    sha256 "a830ea3f2ff829115886d481c2a40cbfbbc7a9398892d40336320f07ffc67407"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-ef9fd62/threedoors-a-darwin-amd64"
    sha256 "1d78e671bec921da94005f372c36f929afc1e7ef46ee2d96c13108ff493bd44f"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-ef9fd62/threedoors-a-linux-amd64"
    sha256 "51c0a8abced5d60040d4a4e0677a029e617cabc34d3412092052ca13abd7b434"
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
