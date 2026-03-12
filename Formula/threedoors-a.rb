class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.182736.3e0cf67"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-182736-3e0cf67/threedoors-a-darwin-arm64"
    sha256 "c53f72565db30306919093c6d908a9fe3a6bdd3381e3674313017b855ddf5efe"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-182736-3e0cf67/threedoors-a-darwin-amd64"
    sha256 "79fb6b20f6a94e7dbcf6db87bb81afea0baf16d88bc81782d7375fd965b2bea6"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-182736-3e0cf67/threedoors-a-linux-amd64"
    sha256 "e97b766cf5fd2b96060b6dffec8ea016c8e564b0d7c888311d6fc96d52a1ae1a"
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
