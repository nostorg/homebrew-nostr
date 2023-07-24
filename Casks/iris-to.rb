cask "iris-to" do
  version "0.2.0"
  sha256 "3e76b52a9e18b002a6ccd58ccc28b5b7cffe38be17bd1e08a3285990c4266e28"

  url "https://github.com/irislib/iris-messenger/releases/download/app-v#{version}/iris_#{version}_x64.dmg",
      verified: "github.com/irislib/iris-messenger/"
  name "Iris"
  desc "Decentralized messenger"
  homepage "https://iris.to/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "iris.app"

  preflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{staged_path}/iris.app"]
  end

  zap trash: [
    "~/Library/Caches/to.iris",
    "~/Library/Saved Application State/to.iris.savedState",
  ]

  caveats do
    requires_rosetta
    <<~EOS
      This app is not signed with an Apple Developer certificate. Therefore in order
      to run it may be necessary to override the macOS security policy. This can be
      done with homebrew using the `--no-quarantine` option:

        brew reinstall --cask --no-quarantine #{token}
    EOS
  end
end
