cask "lume" do
  version "4.1.2"
  sha256 "0266269844517b038217cffb6c67852187a2cd23225f215563e4e7bd141d2a03"

  url "https://github.com/luminous-devs/lume/releases/download/v#{version}/Lume_#{version}_universal.dmg",
      verified: "github.com/luminous-devs/lume/"
  name "Lume"
  desc "Ambitious nostr client"
  homepage "https://lume.nu/"

  livecheck do
    url :url
    strategy :git
  end

  app "Lume.app"

  zap trash: [
    "~/Library/Application Support/nu.lume.Lume",
    "~/Library/Caches/nu.lume.Lume",
    "~/Library/Saved Application State/nu.lume.Lume.savedState",
    "~/Library/WebKit/nu.lume.Lume",
  ]
end
