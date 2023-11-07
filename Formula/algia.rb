class Algia < Formula
  desc "Nostr CLI client written in Go"
  homepage "https://github.com/mattn/algia"
  url "https://github.com/mattn/algia.git",
      tag:      "v0.0.50",
      revision: "98914e8ad2f0890c185d819c3ec077e24168f6a9"
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
