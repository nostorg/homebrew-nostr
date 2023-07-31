cask "nostur" do
  version "1.4.0"
  sha256 "42dbd1f8ddbf59bb481216da88e63747d53a32564f9c4a7ff3c80e33fa339316"

  url "https://nostur.com/Nostur-#{version}.dmg"
  name "Nostur"
  desc "Nostr client"
  homepage "https://nostur.com/"

  livecheck do
    url :homepage
    strategy :page_match
    regex(%r{href=.*?/Nostur-(\d+(?:\.\d+)*)\.dmg}i)
  end

  app "Nostur.app"

  zap trash: [
    "~/Library/Containers/nostur.com.Nostur",
  ]
end
