class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260418.230811.9edcc04"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-230811-9edcc04/sideshow-darwin-arm64"
    sha256 "8967815a8ae0b9b1c6a0b284097fce2d479e355ea08b3f6c44b49a2f1f70efe5"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-230811-9edcc04/sideshow-darwin-amd64"
    sha256 "beaee2f8b3e8746bdb7bc3278d00422c2e78736233737c843acaa75c401e01d1"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-230811-9edcc04/sideshow-linux-amd64"
    sha256 "b5edf5f55b0fe6735ffabdbfdb2f1cc07b61a2a789131839178c92a0f0617ca8"
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
