cask "nostur" do
  version "1.16.0"
  sha256 "335b897bb87fea66e165d080ea9188c4252e6f680112db2b125cf3a268242036"

  url "https://nostur.com/Nostur-#{version}.dmg"
  name "Nostur"
  desc "Nostr client"
  homepage "https://nostur.com/"

  livecheck do
    url :homepage
    strategy :page_match
    regex(%r{href=.*?/Nostur[._-](\d+(?:\.\d+)*)\.dmg}i)
  end

  app "Nostur.app"

  zap trash: "~/Library/Containers/nostur.com.Nostur"
end
