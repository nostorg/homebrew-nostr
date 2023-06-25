class Gossip < Formula
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"
  url "https://github.com/mikedilger/gossip.git",
      tag:      "v0.7.0",
      revision: "7cbb7f5139fc795d2acbff964ed1af037f4e8057"
  license "MIT"
  head "https://github.com/mikedilger/gossip.git", branch: "master"

  depends_on "homebrew/core/rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
