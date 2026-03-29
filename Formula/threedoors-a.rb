class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.171021.3ffca26"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171021-3ffca26/threedoors-a-darwin-arm64"
    sha256 "da1193af5ab6befb395058aa6eddfe13d972dce233ec06a8c89866595c7d636e"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171021-3ffca26/threedoors-a-darwin-amd64"
    sha256 "865fe3c9afca47ffa74592c6450fe657d6c3239b364ef59c684d3969465db906"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171021-3ffca26/threedoors-a-linux-amd64"
    sha256 "09700d9f24e84bd1be4ffc8e9946f48b0a9e7105d7f9a06fd350e93ccc100583"
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
