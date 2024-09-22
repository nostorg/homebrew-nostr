class NostrTool < Formula
  desc "Simple CLI tool to send nostr events"
  homepage "https://github.com/0xtrr/nostr-tool"
  url "https://github.com/0xtrr/nostr-tool.git",
      tag:      "0.5.1",
      revision: "417ec05e068011f7b33a3e69cedb8d09ed99ba40"
  license "MIT"
  head "https://github.com/0xtrr/nostr-tool.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
