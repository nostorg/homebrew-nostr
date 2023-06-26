cask "gossip" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "7553cfa9cc521dabc76917f3e5866ac3a502886aded09f517079b544f09cc71e",
         intel: "511ce16e8bb9a8335889c100205b304a780ba004af4599980f9ebabfa1300b98"

  url "https://github.com/mikedilger/gossip/releases/download/v#{version}/gossip-#{version}-Darwin-#{arch}.dmg"
  name "Gossip"
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip/"

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
