cask "browserport" do
  arch arm: "-arm64", intel: ""

  version "0.2.1"
  sha256 arm:   "1bec691cd517aa0d9d13ec4c264e16f239769a444dcb233afa7719bb52f1742d",
         intel: "ed2f8f9cb29024560a5383e4b05bd2a93b945c420d44788a49aae60dcb107112"

  url "https://github.com/jcyrus/browserport/releases/download/v#{version}/BrowserPort-#{version}#{arch}.dmg"
  name "BrowserPort"
  desc "A cross-platform browser picker utility"
  homepage "https://github.com/jcyrus/browserport"

  depends_on macos: ">= :monterey"

  app "BrowserPort.app"

  zap trash: [
    "~/Library/Application Support/BrowserPort",
    "~/Library/Logs/BrowserPort",
    "~/Library/Preferences/com.browserport.app.plist",
    "~/Library/Saved Application State/com.browserport.app.savedState",
  ]
end
