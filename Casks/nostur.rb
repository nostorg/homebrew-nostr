cask "nostur" do
  version "1.9.0"
  sha256 "f6bb098e266db0b667e78dd3d9ced1001bdd9284fdca4daa615e413a7f996ce6"

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

  zap trash: [
    "~/Library/Containers/nostur.com.Nostur",
  ]
end
