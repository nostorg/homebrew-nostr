class Nak < Formula
  desc "Nostr Army Knife"
  homepage "https://nak.nostr.com/"
  url "https://github.com/fiatjaf/nak.git",
      tag:      "v0.0.16",
      revision: "4a3c7dc825314fe48413775ebaff63a1fc0c9bd7"
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
