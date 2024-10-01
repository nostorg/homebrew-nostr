cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.12.0"
  sha256 arm:   "8057b80ee681f2059cbb7e49f71d61238e59b9498f77aa91df5379d7da68faec",
         intel: "8fd6ca34245998e70885834991292933a30ed5d88281dbdd6b83cc0f88e1a3cc"

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
