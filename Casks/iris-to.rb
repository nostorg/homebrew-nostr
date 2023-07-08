cask "iris-to" do
  version "0.1.0"
  sha256 "0c3321df7420a6abea2e091b824a391e3fd7c81c121ed79b73b73677c87ecb46"

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
