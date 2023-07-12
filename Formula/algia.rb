class Algia < Formula
  desc "Nostr CLI client written in Go"
  homepage "https://github.com/mattn/algia"
  url "https://github.com/mattn/algia.git",
      tag:      "v0.0.43",
      revision: "0512d890bc4b15036c0de4cb61c26840aff59aa5"
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
