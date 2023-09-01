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
    strategy :github_latest
  end

  # Rename to avoid conflict with homebrew/cask/iris
  app "iris.app", target: "Iris Messenger.app"

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
