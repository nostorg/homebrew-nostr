cask "lume" do
  arch arm: "aarch64", intel: "x64"

  version "4.0.15"
  sha256 arm:   "534c98b7606dd4619f9a581a20395c37ed635ed85d475d8a1c23ceeb00c7a3a5",
         intel: "f7feb4be93d4dd374095a6e98008f8b54640a395a9eec1c645c06630a7cc6d49"

  url "https://github.com/luminous-devs/lume/releases/download/v#{version}/Lume_#{version}_#{arch}.dmg",
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
