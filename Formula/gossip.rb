class Gossip < Formula
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"
  url "https://github.com/mikedilger/gossip.git",
      tag:      "v0.4.0",
      revision: "a52888bd36fef57ba7de17f38e4fead675d73981"
  license "MIT"
  head "https://github.com/mikedilger/gossip.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
