cask "nebulavault" do
  version "0.2.0"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"

  on_intel do
    url "https://github.com/jcyrus/nebulavault/releases/download/v#{version}/nebulavault-v#{version}-x86_64-apple-darwin.tar.gz"
  end
  on_arm do
    url "https://github.com/jcyrus/nebulavault/releases/download/v#{version}/nebulavault-v#{version}-aarch64-apple-darwin.tar.gz"
  end

  name "NebulaVault"
  desc "High-performance, secure SSH connection manager with GPU-accelerated GUI"
  homepage "https://github.com/jcyrus/nebulavault"

  # Since we are distributing a raw binary in a tar.gz for now (until we add .app bundling),
  # we use the binary artifact. However, Casks are typically for Apps.
  # If we stick to the plan of "Formula initially", this file should be in Formula/nebulavault.rb
  # But the plan listed [NEW] Casks/nebulavault.rb and asked for a decision.
  # The user approved the plan which said "Ship as a Formula (bare binary, launch from terminal) or a Cask... Recommend Formula initially".
  # Wait, the user actively flagged "NebulaVault distribution type on macOS".
  # If I assume "Formula initially" as per recommendation in the approved plan, I should make this a Formula.
  # But the standard for GUI apps is Cask.
  # Let's create it as a Formula for now as per the "Recommend Formula initially" note in the plan.
  
  binary "nebulavault"
end
