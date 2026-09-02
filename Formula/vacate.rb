class Vacate < Formula
  desc "Find and kill whatever is squatting on a port. TUI + CLI, zero bloat"
  homepage "https://github.com/jcyrus/vacate"
  version "0.1.0"
  license "MIT"

  head "https://github.com/jcyrus/vacate.git", branch: "main"

  depends_on "rust" => :build if build.head?

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "21921cdc4eba56efad9fddfa616c42f1aa37eb86e4e4768e8800c1ad864507b1"
    else
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ded2006cea0e8e4fa5103380879b0d53ebb6e63eaac8691dfc2555d53b9fed34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21d41bee6f0948bc2cebba093964424068e4c5fc3d7fafc7eecbf58344f50999"
    else
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1c12a243efad1ff2ad9b267e262ab6eae74bfcc18ab4e0528559051cbb8acc1"
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
