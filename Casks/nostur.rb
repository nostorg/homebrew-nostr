cask "nostur" do
  version "1.24.4"
  sha256 "c3a49b66723ddcbdf232f928d948b592a76e233db72d9ab9694f8a5df8ca1572"

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
