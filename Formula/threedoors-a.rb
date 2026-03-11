class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.0a9d684"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-0a9d684/threedoors-a-darwin-arm64"
    sha256 "7d6aa250fdffa22fc63d016f29e30ab8410249f62e9899c27733fce4981ddf1b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-0a9d684/threedoors-a-darwin-amd64"
    sha256 "5e9d5ed888abebc20aa6219cd9e473a801bf168530a290123dde2e82fb5f6140"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-0a9d684/threedoors-a-linux-amd64"
    sha256 "86dd5c64e9013a0c8101ede3649091bbadcaf994b5d3226d38f2ac195f7daf95"
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
