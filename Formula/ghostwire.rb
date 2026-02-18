class Ghostwire < Formula
  desc "Secure, ephemeral TUI chat client built with Rust and Ratatui"
  homepage "https://github.com/jcyrus/ghostwire"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-amd64"
      sha256 "deb1518d3afb3f866ad291c906aa5b59fc73884b1fe084bc3f39fb821addb995"
    elsif Hardware::CPU.arm?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-darwin-arm64"
      sha256 "7ae71e7a1665fbf6ac63ae8d2cc2d83925173034a7191ed0facd66b9dcddcf29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jcyrus/ghostwire/releases/download/v#{version}/ghostwire-linux-amd64"
      sha256 "357d73a93453d293c5f89a78699ec0b9c35873c7299baa37cd60fc138cc43bd0"
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
