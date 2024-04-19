cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.10.0"
  sha256 arm:   "2a6430a62e5ba9589c7abd7ec43dab263175ecd79e5d406126d9d74269be9e4f",
         intel: "f8fc5356df8ad0d5ec6dab6cb1e0a2fd0fd2afecb6acbbda8d81b17ce991881b"

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
