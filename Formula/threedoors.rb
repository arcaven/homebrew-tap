class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.34f8bc7"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-34f8bc7/threedoors-darwin-arm64"
    sha256 "fd9078b65ca622d4213ca171d4912a9de00b1c1c47f1567fadca108c0fc845af"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-34f8bc7/threedoors-darwin-amd64"
    sha256 "92bbccd72ac72c500090e49b06e3675d91cc91d328c6dd2bbd62e9de0553c0fa"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
