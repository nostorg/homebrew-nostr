cask "nostur" do
  version "1.15.0"
  sha256 "52f600858b8c5ba83bf3ef346d33b4c0f2a98a67e67d5c61d85cf4aa535001a4"

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
