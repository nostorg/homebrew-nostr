class Gossip < Formula
  desc "Desktop client for Nostr written in Rust"
  homepage "https://github.com/mikedilger/gossip"
  url "https://github.com/mikedilger/gossip.git",
      tag:      "v0.8.1",
      revision: "404f5a405c8796e90bb5cc078378149d3c341f26"
  license "MIT"
  head "https://github.com/mikedilger/gossip.git", branch: "master"

  option "without-cjk", "Compile without CJK (Chinese, Japanese, and Korean) character sets"
  option "without-rustls", "Compile without rustls and use native TLS provider"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  on_macos do
    depends_on "ffmpeg" => :recommended
  end

  on_linux do
    depends_on "libxkbcommon"
    depends_on "mesa"
    depends_on "ffmpeg" => :optional
  end

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

    # for building against sdl2 from homebrew
    ENV.prepend "CPPFLAGS", "-I#{HOMEBREW_PREFIX}/include"
    ENV.prepend "LDFLAGS", "-L#{HOMEBREW_PREFIX}/lib -Wl,-rpath,#{HOMEBREW_PREFIX}/lib"

    system "cargo", "install", *std_cargo_args, *build_args
    cd "target/release" do
      bin.install "gossip"
      if build.with? "ffmpeg"
        libexec.install Dir[shared_library("libSDL2*")]
        bin.install_symlink Dir["#{libexec}/*"]
      end
    end
  end

  test do
    mkdir_p testpath/"Library/Application Support" # for macos
    mkdir_p testpath/".local/share" # for linux
    json = <<~JSON
      {
        "id": "b9fead6eef87d8400cbc1a5621600b360438affb9760a6a043cc0bddea21dab6",
        "kind": 1,
        "pubkey": "82341f882b6eabcd2ba7f1ef90aad961cf074af15b9ef44a09f9d2a8fbfbe6a2",
        "created_at": 1676161639,
        "content": "this is going to work",
        "tags": [],
        "sig": "76d19889a803236165a290fa8f3cf5365af8977ee1e002afcfd37063d1355fc755d0293d27ba0ec1c2468acfaf95b7e950e57df275bb32d7a4a3136f8862d2b7"
      }
    JSON
    assert_match "Valid event", shell_output("#{bin}/gossip verify_json '#{json}'")
  end
end
