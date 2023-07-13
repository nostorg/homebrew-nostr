class Algia < Formula
  desc "Nostr CLI client written in Go"
  homepage "https://github.com/mattn/algia"
  url "https://github.com/mattn/algia.git",
      tag:      "v0.0.44",
      revision: "f7752cf15047e275b7ac5206beb612a41f696619"
  license "MIT"
  head "https://github.com/mattn/algia.git", branch: "master"

  depends_on "homebrew/core/go" => :build

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
