class NostrConsole < Formula
  desc "Command-line client for Nostr using Dart"
  homepage "https://github.com/vishalxl/nostr_console"
  url "https://github.com/vishalxl/nostr_console.git",
      tag:      "v0.3.6-beta",
      revision: "9f507cc5390931702c50e6de6a6b3528de583093"
  license "AGPL-3.0-only"
  head "https://github.com/vishalxl/nostr_console.git", branch: "main"

  livecheck do
    url :stable
    strategy :git
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
