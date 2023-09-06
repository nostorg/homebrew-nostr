class NostrTool < Formula
  desc "Simple CLI tool to send nostr events"
  homepage "https://github.com/0xtrr/nostr-tool"
  url "https://github.com/0xtrr/nostr-tool.git",
      tag:      "0.5.0",
      revision: "e6ef6b5bac11a5bd51a8ec7e51c09184674b17ff"
  license "MIT"
  head "https://github.com/0xtrr/nostr-tool.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
