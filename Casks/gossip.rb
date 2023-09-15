cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.0"
  sha256 arm:   "3b589bbf7357904142922270991748c10e380335124df31434058c416cfc168c",
         intel: "f661810442773c816f2eb1d05ec276a3e443a3d0f4e459d9d7715b88d75f8f41"

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

  caveats <<~EOS
    https://github.com/mikedilger/gossip/blob/master/packaging/macos/README.macos.txt

    This app is not signed with an Apple Developer certificate. Therefore in order
    to run it may be necessary to override the macOS security policy. This can be
    done with homebrew using the `--no-quarantine` option:

      brew reinstall --cask --no-quarantine #{token}
  EOS
end
