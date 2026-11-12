cask "firebreak" do
  version "1.1.1"
  sha256 "fa24c4b8f9ab704548ab3d645a22ec9250b28725e3170d1f4872bec885dc2e1b"

  url "https://github.com/jcyrus/firebreak/releases/download/v#{version}/Firebreak-#{version}.dmg"
  name "Firebreak"
  desc "Native thermal watchdog and runaway process swarm breaker"
  homepage "https://github.com/jcyrus/firebreak"

  depends_on macos: :sonoma

  app "Firebreak.app"

  zap trash: [
    "~/Library/Application Support/Firebreak",
    "~/Library/Caches/com.jcyrus.firebreak",
    "~/Library/Preferences/com.jcyrus.firebreak.plist",
  ]
end
