cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.11.3"
  sha256 arm:   "e66f504c203921705199100d052185be7f482ee1823e487892a1505da5210e8b",
         intel: "cebdb5a740256100786feecc3dbe72743f7435119658cf22943c9f78c7202b99"

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
