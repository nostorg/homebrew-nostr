cask "lume" do
  version "24.11.8"
  sha256 "46a8328c9a4ed332653a73e5e54dfd590cccc97b75bbef33b1351ac36ab85b3d"

  url "https://github.com/lumehq/lume/releases/download/v#{version}/Lume_#{version}_universal.dmg"
  name "Lume"
  desc "Multi-purpose nostr client"
  homepage "https://github.com/lumehq/lume"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Lume.app"

  zap trash: [
    "~/Library/Application Support/nu.lume.Lume",
    "~/Library/Caches/nu.lume.Lume",
    "~/Library/Saved Application State/nu.lume.Lume.savedState",
    "~/Library/WebKit/nu.lume.Lume",
  ]
end
