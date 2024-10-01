cask "lume" do
  version "4.2.0"
  sha256 "1ff1a2ff7ffa86b21477ec41a42bc0d6d025e12ccd592002c7bfb8f9dadadd1a"

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
