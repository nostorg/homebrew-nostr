class Algia < Formula
  desc "Nostr CLI client written in Go"
  homepage "https://github.com/mattn/algia"
  url "https://github.com/mattn/algia.git",
      tag:      "v0.0.54",
      revision: "dbd7f508355d038063e40f12d0bb6b98ab623017"
  license "MIT"
  head "https://github.com/mattn/algia.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/algia", "-h"
  end
end
