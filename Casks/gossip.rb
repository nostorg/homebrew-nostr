cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.11.1"
  sha256 arm:   "0ac0c6151a994e0e29af437f0462d5dbd17e4a1a192b7e16985bf84283e300b7",
         intel: "8f99675f2f2d5c420279e5fd10ae3fad6fb565af93cc11304fad770c7b13981a"

  url "https://github.com/mikedilger/gossip/releases/download/v#{version}/gossip-#{version}-Darwin-#{arch}.dmg"
  name "Gossip"
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"

  livecheck do
    url :url
    strategy :git
  end

  app "Gossip.app"

  zap trash: [
    "~/Library/Application Support/gossip",
    "~/Library/Saved Application State/com.mikedilger.gossip.savedState",
  ]
end
