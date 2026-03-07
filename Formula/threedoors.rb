class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.38543fb"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-38543fb/threedoors-darwin-arm64"
    sha256 "8be487e7a1fd5c20aaf57b72bc7f7c27cbb98edd0e77c62296d5abdd90f05e7b"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-38543fb/threedoors-darwin-amd64"
    sha256 "ad8e02b1fac263f9037d870a5d2758354adeca464a47c4607185865bcb5ae87f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
