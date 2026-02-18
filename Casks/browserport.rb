cask "browserport" do
  version "0.1.3"
  sha256 "97240d3a59575c278ebda18e75a95b5bde470d61c68d7125f109c2c02acdacc9"

  url "https://github.com/jcyrus/browserport/releases/download/v#{version}/BrowserPort-#{version}-arm64.dmg"
  name "BrowserPort"
  desc "A cross-platform browser picker utility"
  homepage "https://github.com/jcyrus/browserport"

  app "BrowserPort.app"

  zap trash: [
    "~/Library/Application Support/BrowserPort",
    "~/Library/Logs/BrowserPort",
    "~/Library/Preferences/com.browserport.app.plist",
    "~/Library/Saved Application State/com.browserport.app.savedState",
  ]
end
