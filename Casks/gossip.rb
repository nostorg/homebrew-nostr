cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.11.0"
  sha256 arm:   "3fd96033c78f6edf272487a8bf694fc10d24004ce9c8c5ef105ad2827f511a48",
         intel: "b9db8c5dd5758b5170e3d888eb36373df5379acd1988e20b479b2f9fa3a132cc"

  url "https://github.com/mikedilger/gossip/releases/download/v#{version.major_minor}/gossip-#{version}-Darwin-#{arch}.dmg"
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
