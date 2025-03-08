cask "coop" do
  version "0.1.3"
  sha256 "89aa981f7c7450f52a82b3ded721a5269f75fad8e28c9d5968415ff58df41f98"

  url "https://github.com/lumehq/coop/releases/download/#{version}-alpha/Coop_#{version}_aarch64.dmg"
  name "Coop"
  desc "Direct message nostr client"
  homepage "https://github.com/lumehq/coop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Coop.app"

  zap trash: [
    "~/Library/Application Support/nu.lume.coop",
    "~/Library/Caches/nu.lume.coop",
    "~/Library/Saved Application State/nu.lume.coop.savedState",
    "~/Library/WebKit/nu.lume.coop",
  ]
end
