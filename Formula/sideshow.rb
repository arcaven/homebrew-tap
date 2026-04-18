class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260418.212559.3cda994"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-212559-3cda994/sideshow-darwin-arm64"
    sha256 "70cc39dfbd3d1226c8f5141290d2e3a372bce446ec6a77935553ebd56a84b115"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-212559-3cda994/sideshow-darwin-amd64"
    sha256 "934982f436157c06f45328ae71679ad1b53cbfcf821d157d40c456d5f24a3d63"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-212559-3cda994/sideshow-linux-amd64"
    sha256 "beb32755d88225314a3cddef9f1d8bb86287add6bd9e902d32e1b59a9bf39eed"
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
