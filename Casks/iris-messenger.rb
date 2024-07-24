cask "iris-messenger" do
  version "0.2.2"
  sha256 "724280f9e1177a9ca7ef6b3e69a6371607ff21238500fbc38f438a28e60216a0"

  url "https://github.com/irislib/iris-messenger/releases/download/app-v#{version}/iris_#{version}_x64.dmg",
      verified: "github.com/irislib/iris-messenger/"
  name "Iris"
  desc "Decentralized messenger"
  homepage "https://iris.to/"

  livecheck do
    url :url
    strategy :git
    regex(/^app[._-]v?(\d+(?:\.\d+)+)$/i)
  end

  # Rename to avoid conflict with homebrew/cask/iris
  app "iris.app", target: "Iris Messenger.app"

  zap trash: [
    "~/Library/Caches/to.iris",
    "~/Library/Saved Application State/to.iris.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
