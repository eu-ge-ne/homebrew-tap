class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.27.tar.gz"
  sha256 "8ef6fa9b6207a71aeb30e1fe777a1c6b07220f44db49dc532ef4b65c67d2f451"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.27"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "48d6c520e73fba22441c8a843dfefca4dc96a004b1367f4dc8417e61c0e1b2c8"
    sha256 cellar: :any_skip_relocation, ventura:       "822d10a793c8a1bf1d28e3e01bbdf33d9eaa2c4d53c661f587320cc76eca92c9"
  end

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_match "toy 0.0.27 (deno 2", shell_output("#{bin}/toy --version")
  end
end
