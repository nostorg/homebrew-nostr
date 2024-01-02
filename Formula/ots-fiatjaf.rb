class OtsFiatjaf < Formula
  desc "OpenTimestamps CLI"
  homepage "https://github.com/fiatjaf/ots"
  url "https://github.com/fiatjaf/ots.git",
      tag:      "v0.2.2",
      revision: "abc7ed7299a464d83cd4dce53c2604b634b9b20c"
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
