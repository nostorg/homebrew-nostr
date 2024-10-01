class NostrCommanderRs < Formula
  desc "Simple but convenient CLI-based Nostr client app"
  homepage "https://github.com/8go/nostr-commander-rs"
  url "https://github.com/8go/nostr-commander-rs.git",
      tag:      "v0.3.0",
      revision: "94f3c005cf4f549d438aa760d8b88e406b9c4ccd"
  license "GPL-3.0"
  head "https://github.com/8go/nostr-commander-rs.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
