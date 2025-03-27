cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.13.0"
  sha256 arm:          "e08c29f02d38064121bb76abd2cdfb6357f869254997dd864e7b092423636b87",
         x86_64:       "3f9d3bd5e7e48cc83e437f53b9605a16b81c0df8b80d3124971c0290405add84",
         arm64_linux:  :no_check,
         x86_64_linux: :no_check

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
