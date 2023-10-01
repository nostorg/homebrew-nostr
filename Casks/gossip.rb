cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "dbfa4b6f46b000ec88eea0952529d2ecea7dea2cb309df6ec6a8050328a40195",
         intel: "f6bc0569f654762831d9a0b4b95d8e4ee0acd48c276a4856428135f91764717a"

  url "https://github.com/mikedilger/gossip/releases/download/v#{version}/gossip-#{version}-Darwin-#{arch}.dmg"
  name "Gossip"
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"

  livecheck do
    url :url
    strategy :github_latest
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
