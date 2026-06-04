class Ghostwire < Formula
  desc "Secure, ephemeral TUI chat client built with Rust and Ratatui"
  homepage "https://github.com/jcyrus/ghostwire"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-amd64"
      sha256 "9336fb8f26326ac261dc7bb1b9e262049c481b0bbc4d68a0ed6414531395e6c9"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-arm64"
      sha256 "0b916d3865e4b33edcbc49720587ef320bc536b2cb4b701f5c6a111acb651a6a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-linux-amd64"
      sha256 "36dc10862094e15756bf63ba61a9081346f5ce7ebb8d84c2690ee2496da67910"
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
