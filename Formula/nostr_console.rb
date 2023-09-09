class NostrConsole < Formula
  desc "Command-line client for Nostr using Dart"
  homepage "https://github.com/vishalxl/nostr_console"
  url "https://github.com/vishalxl/nostr_console.git",
      tag:      "v0.3.5-beta",
      revision: "00125a3b6b2569c4143eb9c09b351fea32e6f851"
  license "AGPL-3.0-only"
  head "https://github.com/vishalxl/nostr_console.git", branch: "main"

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

  depends_on "dart-sdk" => :build

  def install
    system "dart", "pub", "get"
    system "dart", "compile", "exe", "bin/nostr_console.dart"
    bin.install "bin/nostr_console.exe" => "nostr_console"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/nostr_console --version").chomp
  end
end
