class NostrCommanderRs < Formula
  desc "Simple but convenient CLI-based Nostr client app"
  homepage "https://github.com/8go/nostr-commander-rs"
  url "https://github.com/8go/nostr-commander-rs.git",
      tag:      "v0.3.1",
      revision: "8c9362ab8055b02f13df7a85064d615140b9d07b"
  license "GPL-3.0"
  head "https://github.com/8go/nostr-commander-rs.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
