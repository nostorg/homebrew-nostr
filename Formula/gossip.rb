class Gossip < Formula
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"
  url "https://github.com/mikedilger/gossip.git",
      tag:      "v0.6.0",
      revision: "b9b1cf132e00e7ec852c45f449ff27597120a01c"
  license "MIT"
  head "https://github.com/mikedilger/gossip.git", branch: "master"

  depends_on "homebrew/core/rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
