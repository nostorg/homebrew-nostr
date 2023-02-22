class Gossip < Formula
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"
  url "https://github.com/mikedilger/gossip.git",
      tag:      "v0.4.2",
      revision: "1a37e0312faf15e32bf31c7245bebb657d9f57cc"
  license "MIT"
  head "https://github.com/mikedilger/gossip.git", branch: "master"

  depends_on "homebrew/core/rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
