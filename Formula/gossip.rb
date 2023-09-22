class Gossip < Formula
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"
  url "https://github.com/mikedilger/gossip.git",
      tag:      "v0.8.0",
      revision: "c9bb3704e94e105d7cf97de67e89ccf7f01ef69b"
  license "MIT"
  head "https://github.com/mikedilger/gossip.git", branch: "master"

  option "without-cjk", "Compile without CJK (Chinese, Japanese, and Korean) character sets"
  option "without-rustls", "Compile without rustls and use native TLS provider"

  depends_on "cmake" => :build
  depends_on "rust" => :build
  depends_on "ffmpeg" => :recommended

  def install
    build_args = []
    features = []
    features.push("lang-cjk") if build.with? "cjk"
    features.push("video-ffmpeg") if build.with? "ffmpeg"
    features.push("native-tls") if build.without? "rustls"
    build_args.push("--no-default-features") if build.without? "rustls"
    build_args.push("--features=#{features.join(",")}") unless features.empty?

    # required for successful build on intel or linux
    ENV["RUSTFLAGS"] = "--cfg tokio_unstable"

    system "cargo", "install", *std_cargo_args, *build_args
    cd "target/release" do
      bin.install "gossip"
      if build.with? "ffmpeg"
        libexec.install Dir[shared_library("libSDL2*")]
        libexec.install "libSDL2main.a"
        bin.install_symlink Dir["#{libexec}/*"]
      end
    end
  end

  test do
    shell_output("#{bin}/gossip help &>/dev/null", 101)
  end
end
