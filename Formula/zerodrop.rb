class Zerodrop < Formula
  desc "Secure, ephemeral TUI chat client built with Rust and Ratatui"
  homepage "https://github.com/jcyrus/zerodrop"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/zerodrop/releases/download/v#{version}/zerodrop-darwin-amd64"
      sha256 "PLACEHOLDER"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/zerodrop/releases/download/v#{version}/zerodrop-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/zerodrop/releases/download/v#{version}/zerodrop-linux-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    binary = Dir["zerodrop-*"]
      .find { |file| File.file?(file) }
    odie "zerodrop binary not found in release artifact" if binary.nil?

    bin.install binary => "zerodrop"
  end

  test do
    system "#{bin}/zerodrop", "--version"
  end
end
