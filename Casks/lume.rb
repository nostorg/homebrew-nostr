cask "lume" do
  version "1.2.0"
  sha256 "3ab091821d1de4425591c282647b0d9d6bd6d38ceab51add59f4c040a2eb1d0b"

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
