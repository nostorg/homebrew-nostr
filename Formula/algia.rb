class Algia < Formula
  desc "Nostr CLI client written in Go"
  homepage "https://github.com/mattn/algia"
  url "https://github.com/mattn/algia.git",
      tag:      "v0.0.45",
      revision: "b0466aa52fc4fe1f15c8c8dde72d7659427226ac"
  license "MIT"
  head "https://github.com/mattn/algia.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "mod", "tidy"
    system "go", "build"
    bin.install "algia"
  end

  test do
    system "#{bin}/algia", "-h"
  end
end
