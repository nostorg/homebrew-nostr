cask "coop-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.5"
  sha256 arm:          "577883ca3bbdcb1bca6e6e19c51f071db530393a5b643a2b3da304a331a8d4e5",
         x86_64:       "1c6603deb374a71fe0caa71b7002b910a48c17bf069f08d3df55ffa1765976ac",
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
