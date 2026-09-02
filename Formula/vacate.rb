class Vacate < Formula
  desc "Find and kill whatever is squatting on a port. TUI + CLI, zero bloat"
  homepage "https://github.com/jcyrus/vacate"
  version "0.1.3"
  license "MIT"

  head "https://github.com/jcyrus/vacate.git", branch: "main"

  depends_on "rust" => :build if build.head?

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a4bb998b0f9d226e48b9f48c40f5878bdec18d2ef811f09934d5e7f05fdfc5ae"
    else
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "dde1e9228aedd9426f7b25599a45cd071b2017b104406f07039f24a129918159"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4610f9d7940d982f7db345d403d74c120f3161cefeddb60817ee8d1129df9bda"
    else
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5a64d1d1b28517c4c6b7c481f5b0e784b9297b6651e0858eeb3a6795c4ceb74"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "vacate"
    end
  end

  test do
    assert_match "vacate #{version}", shell_output("#{bin}/vacate --version")
  end
end
