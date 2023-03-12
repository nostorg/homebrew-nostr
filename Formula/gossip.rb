class Gossip < Formula
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"
  url "https://github.com/mikedilger/gossip.git",
      tag:      "v0.5.0",
      revision: "9c6cce4f29b3f6f9bf5c2f962724d28a15217927"
  license "MIT"
  head "https://github.com/mikedilger/gossip.git", branch: "master"

  depends_on "homebrew/core/rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
