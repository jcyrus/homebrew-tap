class Ghostwire < Formula
  desc "Secure, ephemeral TUI chat client built with Rust and Ratatui"
  homepage "https://github.com/jcyrus/ghostwire"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-amd64"
      sha256 "99975a2c27ff2e8a878e6383ca194e37d328c6a9d7d510298a93c3a3c60563e1"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-arm64"
      sha256 "492083df710a91842d00cb01f766fb02d2718ad5990f0bdd1f35407377969970"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-linux-amd64"
      sha256 "6c4238e80ac5234d61f5d6e9a18c9441e672435852b13109a06bd176a962041f"
    end
  end

  def install
    binary = Dir["ghostwire-*"]
      .find { |file| File.file?(file) }
    odie "ghostwire binary not found in release artifact" if binary.nil?

    bin.install binary => "ghostwire"
  end

  test do
    system "#{bin}/ghostwire", "--version"
  end
end
