cask "lume" do
  arch arm: "aarch64", intel: "x64"

  version "4.0.8"
  sha256 arm:   "6607153ead96aa4396486e40136a23edbc8273e00e3419f2acc5c24f7890816d",
         intel: "a0bb2e3821f5517d69affd9084c9364f89e2713f853472b767e5901e11860dc4"

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
