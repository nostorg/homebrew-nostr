cask "iris-to" do
  version "0.2.1"
  sha256 "8ba6841c609c52e4fcf8c0de3bb420bff1d4fa1b86e01e0a15d75da828d90e52"

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
