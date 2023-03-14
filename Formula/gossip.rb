class Gossip < Formula
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"
  url "https://github.com/mikedilger/gossip.git",
      tag:      "v0.5.1",
      revision: "5fbdcf0d516accb2489f6b4ffacea4695965ba14"
  license "MIT"
  head "https://github.com/mikedilger/gossip.git", branch: "master"

  depends_on "homebrew/core/rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
