class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260419.063426.7443c86"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-063426-7443c86/sideshow-darwin-arm64"
    sha256 "3f197224a2abfdee5ff59f94762997bbda0cdcbd210d33459accb5389e2ef5d9"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-063426-7443c86/sideshow-darwin-amd64"
    sha256 "90974940521d865f4f08b4ae59fe5ed6029744ce175e80dd6a80d38a6630299c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-063426-7443c86/sideshow-linux-amd64"
    sha256 "c31cc176751abbf58c1502ee839f3656fc5e8e7e92b4052bf624fefcd853d7d7"
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
