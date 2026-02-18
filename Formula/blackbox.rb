class Blackbox < Formula
  desc "A cyberpunk TUI knowledge base. Local first, sync second."
  homepage "https://github.com/jcyrus/blackbox"
  version "0.1.0"
  license "MIT"

  head "https://github.com/jcyrus/blackbox.git", branch: "main"

  depends_on "rust" => :build if build.head?

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/blackbox/releases/download/v#{version}/blackbox-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_MACOS_ARM_SHA256"
    else
      url "https://github.com/jcyrus/blackbox/releases/download/v#{version}/blackbox-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_MACOS_X86_SHA256"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/blackbox/releases/download/v#{version}/blackbox-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_LINUX_ARM_SHA256"
    else
      url "https://github.com/jcyrus/blackbox/releases/download/v#{version}/blackbox-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_LINUX_X86_SHA256"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "blackbox"
    end
  end

  test do
    assert_match "blackbox", shell_output("#{bin}/blackbox --help")
  end
end
