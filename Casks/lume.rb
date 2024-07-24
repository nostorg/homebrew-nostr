cask "lume" do
  arch arm: "aarch64", intel: "x64"

  version "4.0.14"
  sha256 arm:   "5996d352fd4b7244b45fee672c7f9b507afc8b36341af0d3a50823e3597a11a7",
         intel: "0233d9589aa773c72ed5f40158e3044f8a03183d2ffb8286a92a7492d9e46a26"

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
