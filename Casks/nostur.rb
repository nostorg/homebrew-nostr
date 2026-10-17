cask "nostur" do
  version "1.33.0"
  sha256 "9523cb3b9812d4d7c44005e23a18be37dea99fe811e64c522100cb4eebd3606b"

  url "https://nostur.com/Nostur-#{version}.dmg"
  name "Nostur"
  desc "Nostr client"
  homepage "https://nostur.com/"

  livecheck do
    url :homepage
    strategy :page_match
    regex(%r{href=.*?/Nostur[._-](\d+(?:\.\d+)*)\.dmg}i)
  end

  depends_on macos: :monterey

  app "Nostur.app"

  zap trash: "~/Library/Containers/nostur.com.Nostur"
end
