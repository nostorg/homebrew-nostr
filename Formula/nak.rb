class Nak < Formula
  desc "Nostr Army Knife"
  homepage "https://nak.nostr.com/"
  url "https://github.com/fiatjaf/nak.git",
      tag:      "v0.22.0",
      revision: "2bb6e63e4d990bb86741715a031ff53877d0d2ea"
  head "https://github.com/fiatjaf/nak.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/nak", "-h"
  end
end
