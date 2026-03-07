class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.46058a4"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-46058a4/threedoors-darwin-arm64"
    sha256 "c4304dd95385d502384dfd91ed1229521f1cd1d011781be44ff6d580dd94e5f4"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-46058a4/threedoors-darwin-amd64"
    sha256 "5db814377a1dd4e159e09bc51ceabee7eb104ee8b61abb2a6fba7436f7dfa348"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
