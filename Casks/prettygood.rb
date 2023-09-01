cask "prettygood" do
  arch arm: "-arm64"

  version "0.1.2-alpha"
  sha256 arm:   "9d6616f4056dc74862751d160464d4826388e3da7bc56b044e2810b695da33a6",
         intel: "a810932b3df9dddd832604502e472ee2f0d0c68491d9fe777f268c7edfecb705"

  url "https://github.com/wds4/pretty-good/releases/download/v0.1.2-alpha/PrettyGood-#{version}#{arch}.dmg"
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

  caveats <<~EOS
    This app is not signed with an Apple Developer certificate. Therefore in order
    to run it may be necessary to override the macOS security policy. This can be
    done with homebrew using the `--no-quarantine` option:

      brew reinstall --cask --no-quarantine #{token}
  EOS
end
