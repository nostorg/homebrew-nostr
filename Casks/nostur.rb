cask "nostur" do
  version "1.3.0"
  sha256 "06049ddb079b9b2eb2f8280617cf71d9edf28597c90ef8495286c7659836fda7"

  url "https://nostur.com/Nostur-#{version}.dmg"
  name "Nostur"
  desc "Nostr client"
  homepage "https://nostur.com/"

  livecheck do
    url :homepage
    strategy :page_match
    regex(%r{href=.*?/Nostur-(\d+(?:\.\d+)*)\.dmg}i)
  end

  app "Nostur.app"

  zap trash: [
    "~/Library/Containers/nostur.com.Nostur",
  ]
end
