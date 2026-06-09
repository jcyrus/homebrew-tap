class Zerodrop < Formula
  desc "Secure, ephemeral TUI chat client built with Rust and Ratatui"
  homepage "https://github.com/jcyrus/zerodrop"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/zerodrop/releases/download/v#{version}/zerodrop-darwin-amd64"
      sha256 "0e3cfd73e27b1961ff7932973fd91b14e2518371dc85049ae6c5abc7b003efdc"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/zerodrop/releases/download/v#{version}/zerodrop-darwin-arm64"
      sha256 "387bbefc918736cf435f953b0967dffc16256d7f360b4506fb6f66613b1d0aa3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/zerodrop/releases/download/v#{version}/zerodrop-linux-amd64"
      sha256 "f67048073d68106509248f9efa30a80bd1a941fd01dd9bf54fc20bf4eed41cf9"
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
