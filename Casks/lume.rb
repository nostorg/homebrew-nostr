cask "lume" do
  version "4.1.2"
  sha256 "0266269844517b038217cffb6c67852187a2cd23225f215563e4e7bd141d2a03"

  url "https://github.com/lumehq/lume/releases/download/v#{version}/Lume_#{version}_universal.dmg"
  name "Lume"
  desc "Multi-purpose nostr client"
  homepage "https://github.com/lumehq/lume"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Lume.app"

  zap trash: [
    "~/Library/Application Support/nu.lume.Lume",
    "~/Library/Caches/nu.lume.Lume",
    "~/Library/Saved Application State/nu.lume.Lume.savedState",
    "~/Library/WebKit/nu.lume.Lume",
  ]
end
