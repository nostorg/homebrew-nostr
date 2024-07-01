cask "lume" do
  arch arm: "aarch64", intel: "x64"

  version "4.0.12"
  sha256 arm:   "f54730850cd958945768f5be663992001bbd4082c258c305faf91e59f17f3c8d",
         intel: "52d8c42da60b336a21d39614b644b49cf4e58a01900868afa38cc5bace6c4a54"

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
