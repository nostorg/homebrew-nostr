cask "nostur" do
  version "1.21.0"
  sha256 "2d82feae79678a3171e80d6971d939e1307fc6ac86be76a0968ecbfef4332d06"

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
