class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.b83de52"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-b83de52/threedoors-a-darwin-arm64"
    sha256 "f42d31dc5d51d883ccdb15c2bab4268d53cbf4ae63fcd1a089a8aa6cb4e4f8cc"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-b83de52/threedoors-a-darwin-amd64"
    sha256 "777038fe2f5182c90d2b2d3dea867924e0d9d75bdd9548f509b6d335b3a03192"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-b83de52/threedoors-a-linux-amd64"
    sha256 "04e386bf56c227b5ebea6dede6e2ecbc17c41b294307ada3efd30a5f04bc875c"
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
