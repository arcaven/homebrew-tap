class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260422.145308.1a003bc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260422-145308-1a003bc/sideshow-darwin-arm64"
    sha256 "e96832a192714ecb37cae4d4cebe88b278a59e4dc79be05f449cc68388d47160"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260422-145308-1a003bc/sideshow-darwin-amd64"
    sha256 "36362b46e2070aaf280a73726aabc3457b93403db89b3e27eb2ca5e369e586ef"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260422-145308-1a003bc/sideshow-linux-amd64"
    sha256 "2950252f2ae98c7eb7c153c53d1e57b1adf2259a11bae3b881d618a34fcc276e"
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
