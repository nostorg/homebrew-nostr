cask "coop" do
  version "0.1.4-alpha"
  sha256 "aece5cb34a3566c38e73cc7ce683da5b308089228ae8e1e202fea8a01510fd03"

  url "https://github.com/lumehq/coop/releases/download/#{version}/Coop_#{version.match(/[\d.]+/)}_aarch64.dmg"
  name "Coop"
  desc "Direct message nostr client"
  homepage "https://github.com/lumehq/coop"

  livecheck do
    url :url
    strategy :github_latest
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
