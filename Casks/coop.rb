cask "coop" do
  version "0.2.0"
  sha256 "0131ea0bd0b35bdb134387f10d13cf758fda7e95844618e316a289f1e0aad9e2"

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
