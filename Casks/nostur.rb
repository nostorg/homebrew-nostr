cask "nostur" do
  version "1.23.0"
  sha256 "0a82776d688f84aaf813f5b773d918af55f0b5720f20f638df378ac4eb738d44"

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
