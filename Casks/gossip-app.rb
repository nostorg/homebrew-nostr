cask "gossip-app" do
  arch arm: "arm64", intel: "x86_64"

  version "0.14.0"
  sha256 arm:          "0165f5c2aab3f77aca8c4ad09f687363225d27ed35952b84d5251e228fe4ab07",
         x86_64:       "2cb115e49cbcdeed901d9b1cacaaadfd56be0c747a06f6db3e4b283495c56506",
         arm64_linux:  "0",
         x86_64_linux: "0"

  url "https://github.com/mikedilger/gossip/releases/download/v#{version}/gossip-#{version}-Darwin-#{arch}.dmg"
  name "Gossip"
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"

  livecheck do
    url :url
    strategy :github_releases
  end

  app "Gossip.app"

  zap trash: [
    "~/Library/Application Support/gossip",
    "~/Library/Saved Application State/com.mikedilger.gossip.savedState",
  ]
end
