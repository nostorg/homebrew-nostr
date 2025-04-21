cask "nostur" do
  version "1.20.0"
  sha256 "d817b9bca9571fbd5cbfe41c09f23570aa6ffa363325deddd066d9ba5f7f4793"

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
