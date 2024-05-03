cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.10.1"
  sha256 arm:   "c7cc5988177c0f2e6bddcc31945dc089c8959e713a6bcea3078174f75351d26c",
         intel: "b0a20f9e83d6492c58e1a6ac08a7e3f221934f2b3d1f0263737ee725191a19b2"

  url "https://github.com/mikedilger/gossip/releases/download/v#{version}/gossip-#{version}-Darwin-#{arch}.dmg"
  name "Gossip"
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"

  livecheck do
    url :url
    strategy :git
  end

  app "Gossip.app"

  preflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{staged_path}/Gossip.app"]
  end

  zap trash: [
    "~/Library/Application Support/gossip",
    "~/Library/Saved Application State/com.mikedilger.gossip.savedState",
  ]
end
