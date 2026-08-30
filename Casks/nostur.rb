cask "nostur" do
  version "1.31.0"
  sha256 "a9df911b27347e67af7b2da3ee4a907a5c2989857b22a50b48fa5590d39fc50e"

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
