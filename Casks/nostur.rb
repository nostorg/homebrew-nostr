cask "nostur" do
  version "1.25.0"
  sha256 "4648453ccb55ee247331c9453e68a001d96cd8175bba6a8dd6b337e35cb92714"

  url "https://github.com/nostur-com/nostur-ios-public/releases/download/#{version}/Nostur-#{version}.dmg",
      verified: "github.com/nostur-com/"
  name "Nostur"
  desc "Nostr client"
  homepage "https://nostur.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Nostur.app"

  zap trash: "~/Library/Containers/nostur.com.Nostur"
end
