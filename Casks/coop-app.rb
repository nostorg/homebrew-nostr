cask "coop-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:          "1cdb4ebff221392ddb9b6d234b7e91b719ef3be6d0a0e164164da6b4f4af4695",
         x86_64:       "a6a46e12df75b44049cbb5645754554c562f49ddc6418e4e1ae676b9c8ec6a71",
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

  depends_on macos: ">= :big_sur"

  app "Coop.app"

  zap trash: [
    "~/Library/Application Support/nu.lume.coop",
    "~/Library/Caches/nu.lume.coop",
    "~/Library/Saved Application State/nu.lume.coop.savedState",
    "~/Library/WebKit/nu.lume.coop",
  ]
end
