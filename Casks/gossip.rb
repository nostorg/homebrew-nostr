cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.2"
  sha256 arm:   "460b5f449c1b8a15081b259acbd2799541f283d519e28f742c83a74a729317a4",
         intel: "dc4dad4ce8c15fa5bd8ee9d040a12465dfd3bf80e4f311280b07a4360c120520"

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
