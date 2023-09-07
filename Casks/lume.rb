cask "lume" do
  version "1.2.3"
  sha256 "71124235621a043967cf2393219567ab7a855c08c59008259e8823da58b6bdb1"

  url "https://github.com/luminous-devs/lume/releases/download/v#{version}/Lume_#{version}_universal.dmg",
      verified: "github.com/luminous-devs/lume/"
  name "Lume"
  desc "Ambitious nostr client"
  homepage "https://lume.nu/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Lume.app"

  zap trash: [
    "~/Library/Application Support/com.lume.nu",
    "~/Library/Caches/com.lume.nu",
    "~/Library/Preferences/com.lume.nu.plist",
    "~/Library/Saved Application State/com.lume.nu.savedState",
    "~/Library/WebKit/com.lume.nu",
  ]
end
