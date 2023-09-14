cask "nostur" do
  version "1.6.0"
  sha256 "d5faf085e176cf42aefd9503657ee12a77939e872d19b8ddc28878d802ad31c3"

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
