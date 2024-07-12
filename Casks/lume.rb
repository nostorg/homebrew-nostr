cask "lume" do
  arch arm: "aarch64", intel: "x64"

  version "4.0.13"
  sha256 arm:   "8f3cc4feb78a50c0d4f19d63437641c6186391627af520cb887bafec6a2e460b",
         intel: "e56439802040b55244f7e79877b2a53f7363f461c97093df2de352b20dd7a273"

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
