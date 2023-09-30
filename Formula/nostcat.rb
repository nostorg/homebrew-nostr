class Nostcat < Formula
  desc "Websocket client for nostr relay scripting"
  homepage "https://github.com/blakejakopovic/nostcat"
  url "https://github.com/blakejakopovic/nostcat.git",
      tag:      "v0.3.3",
      revision: "6019487899513c7fc711b9a9c07e4517c5de19e2"
  license "MIT"
  head "https://github.com/blakejakopovic/nostcat.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
