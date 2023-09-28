cask "nostur" do
  version "1.7.0"
  sha256 "b1be3d0f34310ae1c55a063de260bdeb294aea1ec2ad0779bddebfc31244e3e0"

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
