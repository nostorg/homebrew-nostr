class OtsFiatjaf < Formula
  desc "OpenTimestamps CLI"
  homepage "https://github.com/fiatjaf/ots"
  url "https://github.com/fiatjaf/ots.git",
      tag:      "v0.3.0",
      revision: "37714d7388d411ec3082079195e309cfbffbfc8e"
  head "https://github.com/fiatjaf/ots.git", branch: "master"

  depends_on "go" => :build

  conflicts_with "ots"

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(output: bin/"ots")
  end

  test do
    system "#{bin}/ots", "-h"
  end
end
