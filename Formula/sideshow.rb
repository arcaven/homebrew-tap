class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260412.003313.edc73e9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-003313-edc73e9/sideshow-darwin-arm64"
    sha256 "525fa6aad842b0fdbb7ce8b5bb0a07cb7ea4f8d6e5c00db7ef40e103c85e37ef"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-003313-edc73e9/sideshow-darwin-amd64"
    sha256 "d0e75a689bf4a5509f698f12a50183b396326d537b5fec9dd1c3759b1b78e381"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-003313-edc73e9/sideshow-linux-amd64"
    sha256 "23d7d8c0ccda3adcb746a526c1ec41de03cc8bbbc032a6d2752045b4bd743a3a"
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
