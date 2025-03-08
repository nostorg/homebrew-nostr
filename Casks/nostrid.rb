cask "nostrid" do
  version "1.33"
  sha256 "47bbc4eeb855b980091e0318a2127b284fb9e8bd85dfe14a47c97ddeaf5168ec"

  url "https://github.com/lapulpeta/Nostrid/releases/download/v#{version}/Nostrid-MacOS-x64-v#{version}.pkg"
  name "Nostrid"
  desc "Multi-platform Nostr client"
  homepage "https://github.com/lapulpeta/Nostrid"

  livecheck do
    url :url
    regex(/^Nostrid[._-]MacOS[._-]x64[._-]v?(\d+(?:\.\d+)+)\.(?:dmg|pkg|zip)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"] || release["prerelease"]

        release["assets"]&.map do |asset|
          match = asset["name"]&.match(regex)
          next if match.blank?

          match[1]
        end
      end.flatten
    end
  end

  pkg "Nostrid-MacOS-x64-v#{version}.pkg"

  uninstall pkgutil: "com.nostrid.nostrid"

  caveats do
    requires_rosetta
  end
end
