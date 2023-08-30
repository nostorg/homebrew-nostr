class NostrCommanderRs < Formula
  desc "Simple but convenient CLI-based Nostr client app"
  homepage "https://github.com/8go/nostr-commander-rs"
  url "https://github.com/8go/nostr-commander-rs.git",
      tag:      "v0.2.2",
      revision: "b879eddd856a50f0b401fb1c99b61ebe14094c1d"
  license "GPL-3.0"
  head "https://github.com/8go/nostr-commander-rs.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
