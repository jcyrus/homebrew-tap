class Spektr < Formula
  desc "Blazing-fast TUI utility for cleaning development artifacts"
  homepage "https://github.com/jcyrus/spektr"
  version "0.1.1"
  license "MIT"

  head "https://github.com/jcyrus/spektr.git", branch: "main"

  depends_on "rust" => :build if build.head?

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/spektr/releases/download/v0.1.1/spektr-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "99f7651bafb50514f332bc5402ccdd8c836acc1be99544ed2fe050760e441381"
    else
      url "https://github.com/jcyrus/spektr/releases/download/v0.1.1/spektr-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "322b0aef06091f57672f27f672667e6b3c8b97fd293959d5916907882a16791a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/spektr/releases/download/v0.1.1/spektr-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8a73e694df464b8c6e9f040602df131757c1fcfaa6ecf3b4383a12b60021a9f"
    else
      url "https://github.com/jcyrus/spektr/releases/download/v0.1.1/spektr-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c679c92af49dfb66e468febae4fdec56200ecd46299b336315ab2c5c92c2fefc"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "spektr"
    end
  end

  test do
    assert_match "spektr", shell_output("#{bin}/spektr --help")
  end
end
