class NostrTool < Formula
  desc "Simple CLI tool to send nostr events"
  homepage "https://github.com/0xtrr/nostr-tool"
  url "https://github.com/0xtrr/nostr-tool.git",
      tag:      "0.4.0",
      revision: "adecf08e69371b63b8a877385773dfa170559451"
  license "MIT"
  head "https://github.com/0xtrr/nostr-tool.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
