class Algia < Formula
  desc "Nostr CLI client written in Go"
  homepage "https://github.com/mattn/algia"
  url "https://github.com/mattn/algia.git",
      tag:      "v0.0.83",
      revision: "4d721e878b05887451ccd073483aef88d9bd3f9b"
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
