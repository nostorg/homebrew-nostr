class Nak < Formula
  desc "Nostr Army Knife"
  homepage "https://nak.nostr.com/"
  url "https://github.com/fiatjaf/nak.git",
      tag:      "v0.4.2",
      revision: "e18e8c00e75cd70b017f368892a579e5057a89e3"
  head "https://github.com/fiatjaf/nak.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/nak", "-h"
  end
end
