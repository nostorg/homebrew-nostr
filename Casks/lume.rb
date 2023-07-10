cask "lume" do
  version "1.0.1"
  sha256 "c2c24ddffbece725e7e2f63ab0d93b80f82cacb80f345ef4475c5a988d7f0bd5"

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
