cask "coop-app" do
  version "0.2.2"
  sha256 "11c213567174699a96cd41901c44c8c26b03862bf5d14207dee172bc48268e82"

  url "https://github.com/lumehq/coop/releases/download/v#{version}/Coop_#{version.match(/[\d.]+/)}_aarch64.dmg"
  name "Coop"
  desc "Direct message nostr client"
  homepage "https://github.com/lumehq/coop"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+(?:-\w+)?)$/i)
  end

  depends_on arch: :arm64

  app "Coop.app"

  zap trash: [
    "~/Library/Application Support/nu.lume.coop",
    "~/Library/Caches/nu.lume.coop",
    "~/Library/Saved Application State/nu.lume.coop.savedState",
    "~/Library/WebKit/nu.lume.coop",
  ]
end
