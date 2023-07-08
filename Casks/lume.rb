cask "lume" do
  version "1.0.0"
  sha256 "f9d44af1fd8718e72c9ac94ae32c4de5abb14011a28d6b74a2069c4a6b3e33fc"

  url "https://github.com/luminous-devs/lume/releases/download/v#{version}/Lume_#{version}_universal.dmg",
    verified: "https://github.com/luminous-devs/lume/"
  name "Lume"
  desc "A cross-platform desktop nostr client"
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
