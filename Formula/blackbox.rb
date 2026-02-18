class Blackbox < Formula
  desc "A cyberpunk TUI knowledge base. Local first, sync second."
  homepage "https://github.com/jcyrus/blackbox"
  version "0.2.1"
  license "MIT"

  head "https://github.com/jcyrus/blackbox.git", branch: "main"

  depends_on "rust" => :build if build.head?

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/blackbox/releases/download/v#{version}/blackbox-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "17a8908274a154382cc114a98bcbda71d69b217143afaa1151cbb1cc8b41cd9c"
    else
      url "https://github.com/jcyrus/blackbox/releases/download/v#{version}/blackbox-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "47dd6643f0b4437ccb16a9af93a0a3b6b95c5bd5e7a062d419a3bf2649cdb7e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/blackbox/releases/download/v#{version}/blackbox-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a30e1a7a246d0f7c40f921cdc1362293f70f9662e55d4ca486a3ef1451f8130f"
    else
      url "https://github.com/jcyrus/blackbox/releases/download/v#{version}/blackbox-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ac1b1b40b6a3e6f426c3c79159d72539fc6f0c88096307a6a2d15ca69bcf8b8"
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
