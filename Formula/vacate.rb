class Vacate < Formula
  desc "Find and kill whatever is squatting on a port. TUI + CLI, zero bloat"
  homepage "https://github.com/jcyrus/vacate"
  version "0.1.2"
  license "MIT"

  head "https://github.com/jcyrus/vacate.git", branch: "main"

  depends_on "rust" => :build if build.head?

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "583430210e73e2957b02961eae97b9de9d5c74310ec293aed9fc78b55c094d2f"
    else
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "54d477f8fccd63377500a7d72834c8ff7e513eedc9b46b94b1335b871fe69e2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9575edf4e4d387f876b310d239ec8f4cfbc6b1d6569647f6600ff9d4dad7b57"
    else
      url "https://github.com/jcyrus/vacate/releases/download/v#{version}/vacate-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12d5619c5934c9d7955c7aeda7445f11b58a54f37b94baeb2399108648ca26ab"
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
