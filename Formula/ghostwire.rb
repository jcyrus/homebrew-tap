class Ghostwire < Formula
  desc "Secure, ephemeral TUI chat client built with Rust and Ratatui"
  homepage "https://github.com/jcyrus/ghostwire"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-amd64"
      sha256 "b21c321063396bbc4c19e33b8c7da0b581a74278d76fef738e8f5c8fe71e30e1"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-arm64"
      sha256 "695162aedb52fc58fa3dff93ef6108edc9c4e3b0e959647d7eb6d6652b749682"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-linux-amd64"
      sha256 "faefd1acf8be625e0c59ac65159e7cc4fb02bf263d39557b7dad069b762b2477"
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
