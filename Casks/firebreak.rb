cask "firebreak" do
  version "1.0.0"
  sha256 "80d02339da5cb73764db2e5f4ddc5f60da07c1688d90f12a701b0e306448e82e"

  url "https://github.com/jcyrus/firebreak/releases/download/v#{version}/Firebreak-#{version}.dmg"
  name "Firebreak"
  desc "Native macOS thermal watchdog and runaway process swarm breaker"
  homepage "https://github.com/jcyrus/firebreak"

  depends_on macos: :sonoma

  app "Firebreak.app"

  zap trash: [
    "~/Library/Application Support/Firebreak",
    "~/Library/Caches/com.jcyrus.firebreak",
    "~/Library/Preferences/com.jcyrus.firebreak.plist",
  ]
end
