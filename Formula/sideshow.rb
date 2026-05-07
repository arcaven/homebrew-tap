class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260507.170917.d369f12"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260507-170917-d369f12/sideshow-darwin-arm64"
    sha256 "ec2c1b56e10c4925ac68b229dd3b47ba2d2cbaddc06830df2c44d435ef29e942"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260507-170917-d369f12/sideshow-darwin-amd64"
    sha256 "219575d6a4cba8ee7390bf761d67fd68adb3346c48b62a0287a54304827a641c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260507-170917-d369f12/sideshow-linux-amd64"
    sha256 "e06c79e2600f67f1a490d3ccab25fdc4345f3194c2c0e7ef636ff6e946d7a50d"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
