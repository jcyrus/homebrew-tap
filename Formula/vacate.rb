class Vacate < Formula
  desc "Find and kill whatever is squatting on a port. TUI + CLI, zero bloat"
  homepage "https://github.com/jcyrus/vacate"
  version "0.1.0"
  license "MIT"

  # jcyrus/vacate ships no release tarballs yet, so build from the crates.io
  # source crate. The #{version} interpolation keeps update-formula.yml able to
  # bump this in place.
  url "https://static.crates.io/crates/vacate/vacate-#{version}.crate"
  sha256 "63b9367285dbfc5823057bd3298658a171a4c4a4ad31cb282a10a65efe204969"

  head "https://github.com/jcyrus/vacate.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "vacate #{version}", shell_output("#{bin}/vacate --version")
  end
end
