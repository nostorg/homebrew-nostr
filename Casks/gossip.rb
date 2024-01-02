cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.0"
  sha256 arm:   "063e209ed9bdba3b64c5d67e0be170883f35bb76df29e6a0922c23eb117a3431",
         intel: "73f6708d70867f0e5cc68d55eaa2d81e49f385adb07d9c783552a8a69204f1e1"

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
