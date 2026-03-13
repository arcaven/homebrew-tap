class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.200825.0a20701"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200825-0a20701/threedoors-a-darwin-arm64"
    sha256 "be80176efca2043d078eddf3df22fc5fd8cf00dce4df72d338c01ccbdef07179"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200825-0a20701/threedoors-a-darwin-amd64"
    sha256 "108663f229bf3775e7cd89ccdf32ee7443f8ab50b5d624d9cae1bba7fd2f0f3e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200825-0a20701/threedoors-a-linux-amd64"
    sha256 "61770be5c7ec81351ace7d7fff7d6edf7f1d6b7214ab4d8d15b1c8ac833eb075"
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
