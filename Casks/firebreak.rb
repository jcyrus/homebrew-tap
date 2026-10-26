cask "firebreak" do
  version "1.1.0"
  sha256 "946684e3adac9f2d6e4616ccdd85e7f65e0e37cf405c322927967d0411a88f35"

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
