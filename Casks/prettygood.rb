cask "prettygood" do
  arch arm: "-arm64"

  version "0.2.0-alpha"
  sha256 arm:   "1e30cb60fc1820274035e5a5f3dec806126d0491a35536bd981b146d43d96e7f",
         intel: "9ec71ea0986c506eb7af48d8d6b7c6a9c370302dad5d1b1e388c8696b92140e5"

  url "https://github.com/wds4/pretty-good/releases/download/v#{version}/PrettyGood-#{version}#{arch}.dmg"
  name "PrettyGood"
  desc "Nostr client motivated by the desire to build a decentralized web of trust"
  homepage "https://github.com/wds4/pretty-good"

  livecheck do
    url :url
    regex(/v?(\d+(?:\.\d+)+(?:-\w+))/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  app "PrettyGood.app"

  preflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{staged_path}/PrettyGood.app"]
  end

  zap trash: [
    "~/Library/Preferences/org.erb.PrettyGood.plist",
    "~/Library/Saved Application State/org.erb.PrettyGood.savedState",
  ]
end
