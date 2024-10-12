cask "lume" do
  version "4.3.0"
  sha256 "9789eec6bd5607e0532ef2ca1741d795e67a24d0f2c36de8588ad6f48da95caa"

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
