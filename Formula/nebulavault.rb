class Nebulavault < Formula
  desc "High-performance, secure SSH connection manager with GPU-accelerated GUI"
  homepage "https://github.com/jcyrus/nebulavault"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/nebulavault/releases/download/v#{version}/nebulavault-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "54b516466cc1b50bf7b6972717946513a378d8608c6e8d62717450c7e115c9c8"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/nebulavault/releases/download/v#{version}/nebulavault-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e3ba7c664a7e9ffca1aea2512afb097422b9abcdfec7b74bf427939d15b9ca93"
    end
  end

  def install
    bin.install "nebulavault"
  end

  test do
    system "#{bin}/nebulavault", "--help"
  end
end
