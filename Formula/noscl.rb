class Noscl < Formula
  desc "Command-line client for Nostr written in Go"
  homepage "https://github.com/fiatjaf/noscl"
  url "https://github.com/fiatjaf/noscl.git",
      tag:      "v0.6.0",
      revision: "b4a7e31e09967548d99d477bc6079c43d895e91c"
  license :public_domain
  head "https://github.com/fiatjaf/noscl.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "mod", "tidy"
    system "go", "build"
    bin.install "noscl"
  end

  test do
    system "#{bin}/noscl", "-h"
  end
end
