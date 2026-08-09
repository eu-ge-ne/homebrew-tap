class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.32.tar.gz"
  sha256 "00acf6b2d62215a9d1be6dbd08a84675afc28caa4f4dafca58ad4f0e5b7e0452"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.32"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4136ce588289ceb46a2de3d24352ffcba8a07ec5c8693b9bfc696a1f2379c6f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a3dd9611f416ccc1fcfb75397d3fe8736981098f7d48796a682812bff5912e20"
  end

  depends_on "deno" => :build

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "src/main.ts"
    bin.install "toy"
  end

  test do
    assert_match "toy #{version} (deno 2", shell_output("#{bin}/toy --version")
  end
end
