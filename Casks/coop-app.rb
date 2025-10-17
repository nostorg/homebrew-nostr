cask "coop-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.11"
  sha256 arm:          "8583a0aef04e44177f7389b6ac209437c5343bd9f982f00a7b8263fe86475809",
         x86_64:       "7cb039637a23561e6d36c6528eed1fc54bd32220811314c5d791696149a2ebe5",
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
