cask "nostur" do
  version "1.27.0"
  sha256 "d672cd6305f6a837336e6ab9b37b3b615005623ff4c13969f9201c48333d5954"

  url "https://nostur.com/Nostur-#{version}.dmg"
  name "Nostur"
  desc "Nostr client"
  homepage "https://nostur.com/"

  livecheck do
    url :homepage
    strategy :page_match
    regex(%r{href=.*?/Nostur[._-](\d+(?:\.\d+)*)\.dmg}i)
  end

  depends_on macos: ">= :monterey"

  app "Nostur.app"

  zap trash: "~/Library/Containers/nostur.com.Nostur"
end
