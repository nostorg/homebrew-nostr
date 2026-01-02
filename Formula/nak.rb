class Nak < Formula
  desc "Nostr Army Knife"
  homepage "https://nak.nostr.com/"
  url "https://github.com/fiatjaf/nak.git",
      tag:      "v0.17.4",
      revision: "81524de04fb040265b88a8bfd2ba354d415e6d00"
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
