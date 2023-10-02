class Nostril < Formula
  desc "CLI util for generating nostr events"
  homepage "https://github.com/jb55/nostril"
  url "https://github.com/nostorg/nostril.git",
      tag:      "v0.0.1",
      revision: "8726ad3b15f10e5a09864bbef61f7a35d1d2f3d7"
  license "MIT"
  head "https://github.com/jb55/nostril.git", branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "make"
    bin.install "nostril"
    bin.install "nostril-query"
    man1.install "doc/nostril.1"
  end
end
