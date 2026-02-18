class Nebulavault < Formula
  desc "High-performance, secure SSH connection manager with GPU-accelerated GUI"
  homepage "https://github.com/jcyrus/nebulavault"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/nebulavault/releases/download/v#{version}/nebulavault-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/nebulavault/releases/download/v#{version}/nebulavault-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
  end

  def install
    bin.install "nebulavault"
  end

  test do
    system "#{bin}/nebulavault", "--help"
  end
end
