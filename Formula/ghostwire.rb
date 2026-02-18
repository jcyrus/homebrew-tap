class Ghostwire < Formula
  desc "Secure, ephemeral TUI chat client built with Rust and Ratatui"
  homepage "https://github.com/jcyrus/ghostwire"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-amd64"
      sha256 "0904b5d941d6c438abe7685f5f4d1294c8aa324319182b4f8bf300e3d9e7d86a"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-arm64"
      sha256 "fb8f20200366d373e33556cc02dec19da3ed913a07d5651cd33478287ee20c92"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-linux-amd64"
      sha256 "57641e7b64cc17da96c022530ab7aa02d57caa9bfe8fba169d6a25a548486170"
    end
  end

  def install
    binary = Dir["ghostwire-*"]
      .find { |file| File.file?(file) }
    odie "ghostwire binary not found in release artifact" if binary.nil?

    bin.install binary => "ghostwire"
  end

  test do
    # Basic smoke test - check binary executes
    system "#{bin}/ghostwire", "--version"
  end
end
