class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.172414.22b77ce"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-172414-22b77ce/threedoors-a-darwin-arm64"
    sha256 "bf2b6b07fa1fffc2b14902db9677c7843cf17769e99a5a8e89df4756428beb75"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-172414-22b77ce/threedoors-a-darwin-amd64"
    sha256 "57c047124c143ca122d9b98fc89d7f94cbd6c3e55c074659e30ca73ff366fdec"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-172414-22b77ce/threedoors-a-linux-amd64"
    sha256 "7a666c1086c119c76504966e313158c534017f68178bcaaea24018881311af10"
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
