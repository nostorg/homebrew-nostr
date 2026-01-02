cask "notedeck" do
  arch arm: "arm64", intel: "x64"

  version "0.7.1"
  sha256 arm:          "e97c654c824c047701721345801fd3e6161066763405a2fc58d71a813e27cb78",
         intel:        "a61d64323954bb0b65d603be7fd5c5c7f23de6c9188cbd35354824ce87e5d706",
         arm64_linux:  "0",
         x86_64_linux: "0"

  url "https://damus.io/notedeck/dl/v#{version}/notedeck_v#{version}-#{arch}.dmg"
  name "Notedeck"
  desc "Nostr client by creators of Damus"
  homepage "https://damus.io/notedeck/"

  livecheck do
    skip "Check manually at https://damus.io/notedeck/install/"
  end

  depends_on macos: ">= :big_sur"

  app "Notedeck.app"

  zap trash: "~/Library/Application Support/notedeck"
end
