cask "lume" do
  version "1.2.7"
  sha256 "ccc09bd6c1e2891be9034ddefa387671a9c723ac59fd09021b6911a95b6931d9"

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
