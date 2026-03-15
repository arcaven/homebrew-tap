class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.234111.cf9dbdc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-234111-cf9dbdc/threedoors-a-darwin-arm64"
    sha256 "b3fb9d285512fb6cb87d32ef3c3d59e8ec292008e1f2186f372c1725fc586a98"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-234111-cf9dbdc/threedoors-a-darwin-amd64"
    sha256 "baf450d58c6ec198efd67e7bae47ff9f080853b10b15089fc7f909f8f136fb2d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-234111-cf9dbdc/threedoors-a-linux-amd64"
    sha256 "6055c6cc108715804cad911325bf3f2b2a2cbdc0b7e97222adddc4d2b6503f8e"
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
