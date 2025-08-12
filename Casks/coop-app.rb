cask "coop-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.2"
  sha256 arm:          "11c213567174699a96cd41901c44c8c26b03862bf5d14207dee172bc48268e82",
         x86_64:       "58ef1bad98e59f6b4c0185e41c651d8f4707462df8577b40c11baccd3bf0e424",
         arm64_linux:  "0",
         x86_64_linux: "0"

  url "https://github.com/lumehq/coop/releases/download/v#{version}/Coop_#{version.match(/[\d.]+/)}_#{arch}.dmg"
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
