cask "coop" do
  version "0.1.7"
  sha256 "de4f5b7e3105946d6304876c61daa3ae06629fcc57e496f705f53be11929c177"

  url "https://github.com/lumehq/coop/releases/download/v#{version}/Coop_#{version}_universal.dmg"
  name "Coop"
  desc "Direct message nostr client"
  homepage "https://github.com/lumehq/coop"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Coop.app"

  zap trash: [
    "~/Library/Application Support/nu.lume.coop",
    "~/Library/Caches/nu.lume.coop",
    "~/Library/Saved Application State/nu.lume.coop.savedState",
    "~/Library/WebKit/nu.lume.coop",
  ]
end
