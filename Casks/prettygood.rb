cask "prettygood" do
  arch arm: "-arm64"

  version "0.2.1-alpha"
  sha256 arm:   "4a11737ddb6b916450cd04a023eb42211073d0f17bd004614fbffbbb0d9e0876",
         intel: "d561d95df7b12109a5f435eecca87a1777c767442fc556d0b9941d25ca2fc17f"

  url "https://github.com/wds4/pretty-good/releases/download/v#{version}/PrettyGood-#{version}#{arch}.dmg"
  name "PrettyGood"
  desc "Nostr client motivated by the desire to build a decentralized web of trust"
  homepage "https://github.com/wds4/pretty-good"

  livecheck do
    url :url
    strategy :git
  end

  app "PrettyGood.app"

  zap trash: [
    "~/Library/Preferences/org.erb.PrettyGood.plist",
    "~/Library/Saved Application State/org.erb.PrettyGood.savedState",
  ]
end
