cask "prettygood" do
  version "0.2.1-alpha"
  sha256 "d561d95df7b12109a5f435eecca87a1777c767442fc556d0b9941d25ca2fc17f"

  url "https://github.com/wds4/pretty-good/releases/download/v#{version}/PrettyGood-#{version}.dmg"
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

  caveats do
    # ARM build was removed due to a bug
    # see https://github.com/wds4/pretty-good/releases/tag/v0.2.1-alpha
    requires_rosetta
  end
end
