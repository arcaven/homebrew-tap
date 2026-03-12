class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.003937.abe7c90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-003937-abe7c90/threedoors-a-darwin-arm64"
    sha256 "656058cd2be3a815d9b05d4be2c823f1f29070de510954780b7e69a46a35e98e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-003937-abe7c90/threedoors-a-darwin-amd64"
    sha256 "c6071f222adc3f960b22bb769ff325bf0f47f71881b5d4d3c2b08255845a4563"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-003937-abe7c90/threedoors-a-linux-amd64"
    sha256 "c5932132a045c6eef608f1c1c2b871bd95c4415b6018b1da9f5ef916e47bd896"
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
