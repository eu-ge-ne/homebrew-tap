class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.30.tar.gz"
  sha256 "84c506eaa424634c9cc0381edc7ac1f4e3a045487e4a3cc8ef08814f258fe1f3"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.30"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "04fe4908a74a4181b2ca875c776ab219731c43314544eef0afff49c2dac2f7af"
  end

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "src/main.ts"
    bin.install "toy"
  end

  test do
    assert_match "toy 0.0.30 (deno 2", shell_output("#{bin}/toy --version")
  end
end
