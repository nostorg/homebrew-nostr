cask "coop-app" do
  version "0.1.5-alpha"
  sha256 "be9ab79ff91062c7cbcba4bf9b97a1b4a381cdac3dadd08fefa1a882fac01f94"

  url "https://github.com/lumehq/coop/releases/download/#{version}/Coop_#{version.match(/[\d.]+/)}_aarch64.dmg"
  name "Coop"
  desc "Direct message nostr client"
  homepage "https://github.com/lumehq/coop"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+(?:-\w+))$/i)
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
