class NostrCommanderRs < Formula
  desc "Simple but convenient CLI-based Nostr client app"
  homepage "https://github.com/8go/nostr-commander-rs"
  url "https://github.com/8go/nostr-commander-rs.git",
      tag:      "v0.2.5",
      revision: "590823dd96c70d876c892f3f47174049f744380c"
  license "GPL-3.0"
  head "https://github.com/8go/nostr-commander-rs.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
